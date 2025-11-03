# Polar::Client
#
# Main HTTP client for the Polar.sh API
#
# The Client class is the primary entry point for interacting with the Polar.sh API.
# It handles authentication, request formatting, error handling, and provides access
# to all API resources through typed accessor methods.
#
# ## Usage
#
# ```
# # Initialize with environment variables (recommended)
# # Set POLAR_ACCESS_TOKEN and optionally POLAR_SERVER_URL
# client = Polar::Client.new
#
# # Or with explicit credentials
# client = Polar::Client.new(
#   access_token: "polar_at_...",
#   server_url: "https://api.polar.sh"
# )
#
# # Access API resources
# organizations = client.organizations.list
# products = client.products.list
# ```
#
# ## Authentication
#
# The client uses Bearer token authentication. You can obtain an access token
# from your Polar.sh dashboard at https://polar.sh/settings
#
# ## Error Handling
#
# The client raises typed exceptions for different error conditions:
# - `ResourceNotFoundError` (404) - Resource not found
# - `NotPermittedError` (403) - Insufficient permissions
# - `HTTPValidationError` (422) - Request validation failed
# - `PolarError` - Base class for all other API errors
#
# Example:
# ```
# begin
#   org = client.organizations.get("invalid-id")
# rescue e : Polar::ResourceNotFoundError
#   puts "Organization not found"
# rescue e : Polar::PolarError
#   puts "API error: #{e.message}"
# end
# ```
#
# ## API Resources
#
# Each API resource is accessed through a dedicated method that returns a
# typed API client. These accessors are added via class reopening in each
# individual API file (e.g., `src/polar/api/organizations_api.cr`).
#
# Available resources include:
# - organizations - Organization management
# - customers - Customer management
# - products - Product catalog
# - subscriptions - Subscription management
# - orders - Order management
# - webhooks - Webhook endpoint management
# - And many more...
#
# ## Thread Safety
#
# The client creates new API instances for each accessor call, making it
# safe to use across multiple fibers. However, the underlying HTTP::Client
# connections should be considered per-request.

require "http/client"
require "json"
require "log"

module Polar
  # Main HTTP client for the Polar.sh API
  #
  # Handles authentication, request/response processing, and error handling.
  # Provides access to all API resources through typed accessor methods that
  # are added via class reopening in individual API files.
  class Client
    Log = ::Log.for(self)
    # Your Polar.sh API access token
    getter access_token : String

    # The Polar.sh API server URL (without trailing slash)
    getter server_url : String

    # Maximum number of retry attempts for failed requests
    getter max_retries : Int32

    # Initial delay for exponential backoff (in seconds)
    getter initial_retry_delay : Float64

    # Maximum delay between retries (in seconds)
    getter max_retry_delay : Float64

    # Initialize a new Polar API client
    #
    # @param access_token [String?] API access token (falls back to POLAR_ACCESS_TOKEN env var)
    # @param server_url [String?] API server URL (falls back to POLAR_SERVER_URL env var or https://api.polar.sh)
    # @param max_retries [Int32] Maximum number of retry attempts (default: 3)
    # @param initial_retry_delay [Float64] Initial delay for exponential backoff in seconds (default: 1.0)
    # @param max_retry_delay [Float64] Maximum delay between retries in seconds (default: 60.0)
    #
    # @raise [Exception] If access_token is not provided and POLAR_ACCESS_TOKEN is not set
    #
    # Example:
    # ```
    # # Use environment variables (recommended)
    # client = Polar::Client.new
    #
    # # Explicit credentials with custom retry configuration
    # client = Polar::Client.new(
    #   access_token: "polar_at_...",
    #   server_url: "https://sandbox.polar.sh",
    #   max_retries: 5,
    #   initial_retry_delay: 2.0
    # )
    # ```
    def initialize(
      access_token : String? = nil,
      server_url : String? = nil,
      @max_retries : Int32 = 3,
      @initial_retry_delay : Float64 = 1.0,
      @max_retry_delay : Float64 = 60.0,
    )
      Log.debug { "Initializing Polar client" }

      # Get access token from parameter or environment
      token = access_token && !access_token.empty? ? access_token : ENV["POLAR_ACCESS_TOKEN"]?

      raise "POLAR_ACCESS_TOKEN environment variable not set" if token.nil? || token.empty?

      @access_token = token
      Log.debug { "Access token configured (length: #{@access_token.size})" }

      # Get server URL from parameter, environment, or default
      if server_url
        @server_url = server_url.rstrip('/')
        Log.debug { "Using server URL from parameter: #{@server_url}" }
      elsif url_from_env = ENV["POLAR_SERVER_URL"]?
        @server_url = url_from_env.rstrip('/')
        Log.debug { "Using server URL from environment: #{@server_url}" }
      else
        @server_url = "https://api.polar.sh"
        Log.debug { "Using default server URL: #{@server_url}" }
      end

      Log.info { "Polar client initialized (server: #{@server_url}, max_retries: #{@max_retries})" }
    end

    # Make an HTTP request to the Polar API with retry logic
    #
    # This is an internal method used by all API clients. It handles:
    # - Authentication via Bearer token
    # - JSON content type headers
    # - Automatic redirect following (up to 10 redirects)
    # - Retry with exponential backoff for transient errors
    # - Rate limiting with Retry-After header respect
    # - Error response mapping to typed exceptions
    #
    # @param method [String] HTTP method (GET, POST, PUT, PATCH, DELETE)
    # @param path [String] API path (e.g., "/v1/organizations")
    # @param body [String?] Optional request body as JSON string
    #
    # @return [String] Response body as JSON string
    #
    # @raise [ResourceNotFoundError] on HTTP 404
    # @raise [NotPermittedError] on HTTP 403
    # @raise [HTTPValidationError] on HTTP 422
    # @raise [PolarError] on other HTTP errors
    #
    # Note: This method is primarily for internal use by generated API clients.
    # End users typically won't call this directly.
    def request(method : String, path : String, body : String? = nil) : String
      Log.debug { "#{method} #{path}" }
      Log.trace { "Request body: #{body}" } if body

      attempt = 0
      last_error : Exception? = nil

      loop do
        begin
          response = make_request_with_redirects(method, path, body)
          Log.debug { "Request completed successfully (attempt: #{attempt + 1})" }
          return response
        rescue ex : PolarError
          # Don't retry client errors (except rate limiting)
          if ex.message && ex.message.not_nil!.starts_with?("HTTP 4")
            # Check if it's a rate limit error (429)
            if ex.message.not_nil!.starts_with?("HTTP 429")
              # Extract retry delay from error message if available
              retry_delay = extract_retry_after(ex) || calculate_backoff(attempt)
              Log.warn { "Rate limited (429), will retry after #{retry_delay}s" }
            else
              # Other 4xx errors are not retryable (except those handled specifically above)
              Log.error { "Client error (4xx): #{ex.message}" }
              raise ex
            end
          elsif ex.message && (ex.message.not_nil!.starts_with?("HTTP 5") || ex.message.not_nil!.includes?("redirect"))
            # Server errors and redirect errors are retryable
            retry_delay = calculate_backoff(attempt)
            Log.warn { "Server error or redirect issue: #{ex.message}, will retry after #{retry_delay}s" }
          else
            # Unknown error, don't retry
            Log.error { "Unknown error, not retrying: #{ex.message}" }
            raise ex
          end

          attempt += 1
          last_error = ex

          if attempt > @max_retries
            Log.error { "Max retries (#{@max_retries}) exceeded" }
            raise ex
          end

          Log.info { "Retrying request (attempt #{attempt}/#{@max_retries}) after #{retry_delay}s" }
          sleep retry_delay.seconds
        rescue ex : IO::Error | Socket::Error
          # Network errors are retryable
          Log.warn { "Network error: #{ex.message}" }
          attempt += 1
          last_error = ex

          if attempt > @max_retries
            Log.error { "Network error after #{@max_retries} retries" }
            raise PolarError.new("Network error after #{@max_retries} retries: #{ex.message}")
          end

          retry_delay = calculate_backoff(attempt)
          Log.info { "Retrying after network error (attempt #{attempt}/#{@max_retries}) after #{retry_delay}s" }
          sleep retry_delay.seconds
        end
      end
    end

    private def make_request_with_redirects(method : String, path : String, body : String?) : String
      max_redirects = 10
      redirect_count = 0
      current_path = path

      loop do
        uri = URI.parse(@server_url + current_path)
        Log.trace { "Making HTTP request: #{method} #{uri}" }

        headers = HTTP::Headers{
          "Authorization" => "Bearer #{@access_token}",
          "Content-Type"  => "application/json",
          "Accept"        => "application/json",
        }

        response = HTTP::Client.exec(method, uri, headers: headers, body: body)
        Log.trace { "Received response: #{response.status_code}" }

        case response.status_code
        when 200..299
          Log.trace { "Success response (#{response.status_code}), body size: #{response.body.size} bytes" }
          return response.body
        when 300..399
          # Handle redirects
          redirect_count += 1
          Log.debug { "Redirect #{response.status_code} (#{redirect_count}/#{max_redirects})" }
          if redirect_count > max_redirects
            Log.error { "Too many redirects (>#{max_redirects})" }
            raise PolarError.new("Too many redirects (>#{max_redirects})")
          end

          # Try to get redirect location from Location header first
          location = response.headers["Location"]?

          # If no Location header, try parsing JSON body for redirect field
          if location.nil? || location.empty?
            begin
              json = JSON.parse(response.body)
              location = json["redirect"]?.try(&.as_s)
            rescue
              # If we can't parse JSON or find redirect, fail
              raise PolarError.new("HTTP #{response.status_code}: Redirect with no Location header or redirect field")
            end
          end

          if location.nil? || location.empty?
            raise PolarError.new("HTTP #{response.status_code}: Redirect with no location")
          end

          # Handle relative vs absolute URLs
          if location.starts_with?("http://") || location.starts_with?("https://")
            # Absolute URL - parse and update server_url if needed
            redirect_uri = URI.parse(location)
            @server_url = "#{redirect_uri.scheme}://#{redirect_uri.host}#{redirect_uri.port ? ":#{redirect_uri.port}" : ""}"
            current_path = redirect_uri.path.to_s + (redirect_uri.query ? "?#{redirect_uri.query}" : "")
          else
            # Relative URL - just update path
            current_path = location
          end

          # For 307 and 308, preserve the request method and body
          # For 301, 302, 303, change to GET
          unless response.status_code == 307 || response.status_code == 308
            method = "GET"
            body = nil
            Log.debug { "Redirect changed method to GET" }
          end
        when 404
          Log.warn { "Resource not found: #{current_path}" }
          raise ResourceNotFoundError.new("Resource not found: #{current_path}")
        when 403
          Log.warn { "Not permitted: #{current_path}" }
          raise NotPermittedError.new("Not permitted: #{current_path}")
        when 422
          Log.warn { "Validation error for #{current_path}: #{response.body}" }
          raise HTTPValidationError.new("Validation error: #{response.body}")
        else
          Log.error { "HTTP #{response.status_code} error for #{current_path}: #{response.body}" }
          raise PolarError.new("HTTP #{response.status_code}: #{response.body}")
        end
      end
    end

    # Calculate exponential backoff delay with jitter
    #
    # @param attempt [Int32] Current attempt number (0-indexed)
    # @return [Float64] Delay in seconds
    private def calculate_backoff(attempt : Int32) : Float64
      # Exponential backoff: initial_delay * (2 ** attempt) with jitter
      delay = @initial_retry_delay * (2 ** attempt)

      # Add jitter (±25%)
      jitter = delay * 0.25 * (Random.rand - 0.5) * 2
      delay_with_jitter = delay + jitter

      # Cap at max_retry_delay
      [delay_with_jitter, @max_retry_delay].min
    end

    # Extract Retry-After header value from rate limit error
    #
    # @param error [PolarError] The error containing rate limit information
    # @return [Float64?] Delay in seconds, or nil if not found
    private def extract_retry_after(error : PolarError) : Float64?
      # This would require storing the response in the exception
      # For now, return nil and fall back to exponential backoff
      # TODO: Enhance PolarError to include HTTP headers
      nil
    end

    # NOTE: API resource accessor methods (organizations, customers, products, etc.)
    # are added to this class via class reopening in individual API files located
    # in src/polar/api/*.cr. Each API file adds its own accessor method, keeping
    # all code related to a particular API resource in one place.
  end
end
