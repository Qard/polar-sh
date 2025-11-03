# Oauth2
#
# API client for oauth2 resource operations.
#
# Auto-generated from OpenAPI spec
module Polar
  module Api
    # Oauth2 namespace for oauth2 operations
    module Oauth2
      # API client for clients operations in oauth2 context
      class Clients
        Log = ::Log.for(self)

        # Creates a new Clients instance
        #
        # @param client [Client] The Polar API client instance
        def initialize(@client : Client)
          Log.debug { "Initialized Oauth2::Clients API client" }
        end

        # Create Client
        #
        # Create an OAuth2 client.
        #
        # **Endpoint:** `POST /v1/oauth2/register`
        #
        # **Parameters:**
        # - `body` (required): Request body as Polar::Models::OAuth2ClientConfiguration
        #
        # **Returns:** JSON response string
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def create_client(body : Polar::Models::OAuth2ClientConfiguration)
          Log.debug { "Calling create_client" }
          url = "/v1/oauth2/register"
          response = @client.request("POST", url, body: body.to_json)
          Log.debug { "create_client completed successfully" }
          response
        end

        # Get Client
        #
        # Get an OAuth2 client by Client ID.
        #
        # **Endpoint:** `GET /v1/oauth2/register/{client_id}`
        #
        # **Parameters:**
        # - `client_id` (required): Path parameter
        #
        # **Returns:** JSON response string
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def get_client(client_id : String)
          Log.debug { "Calling get_client" }
          url = "/v1/oauth2/register/#{client_id}"
          response = @client.request("GET", url)
          Log.debug { "get_client completed successfully" }
          response
        end

        # Update Client
        #
        # Update an OAuth2 client.
        #
        # **Endpoint:** `PUT /v1/oauth2/register/{client_id}`
        #
        # **Parameters:**
        # - `client_id` (required): Path parameter
        # - `body` (required): Request body as Polar::Models::OAuth2ClientConfigurationUpdate
        #
        # **Returns:** JSON response string
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def update_client(client_id : String, body : Polar::Models::OAuth2ClientConfigurationUpdate)
          Log.debug { "Calling update_client" }
          url = "/v1/oauth2/register/#{client_id}"
          response = @client.request("PUT", url, body: body.to_json)
          Log.debug { "update_client completed successfully" }
          response
        end

        # Delete Client
        #
        # Delete an OAuth2 client.
        #
        # **Endpoint:** `DELETE /v1/oauth2/register/{client_id}`
        #
        # **Parameters:**
        # - `client_id` (required): Path parameter
        #
        # **Returns:** JSON response string
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def delete_client(client_id : String)
          Log.debug { "Calling delete_client" }
          url = "/v1/oauth2/register/#{client_id}"
          response = @client.request("DELETE", url)
          Log.debug { "delete_client completed successfully" }
          response
        end
      end

      # Main Oauth2 class with resource accessors
      class Base
        def initialize(@client : Client)
        end

        # Access clients operations
        def clients : Clients
          Clients.new(@client)
        end
      end
    end
  end

  # Extend Client class with oauth2 API accessor
  class Client
    # Access the oauth2 API
    #
    # @return [Api::Oauth2::Base] The oauth2 API client
    def oauth2 : Api::Oauth2::Base
      Api::Oauth2::Base.new(self)
    end
  end
end
