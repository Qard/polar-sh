# LicenseKeys
#
# API client for license_keys resource operations.
#
# This class provides methods for interacting with license_keys-related endpoints
# in the Polar.sh API. All methods return JSON response strings that can be
# parsed into appropriate model types.
#
# Auto-generated from OpenAPI spec
module Polar
  module Api
    # API client for license_keys operations
    class LicenseKeys
      Log = ::Log.for(self)

      # Creates a new LicenseKeys instance
      #
      # @param client [Client] The Polar API client instance
      def initialize(@client : Client)
        Log.debug { "Initialized LicenseKeys API client" }
      end

      # List License Keys
      #
      # Get license keys connected to the given organization & filters.
      #
      # Scopes: license_keys:read license_keys:write
      #
      # **Endpoint:** `GET /v1/license-keys/`
      #
      # **Parameters:**
      # - `organization_id` (optional): Filter by organization ID.
      # - `benefit_id` (optional): Filter by benefit ID.
      # - `page` (optional): Page number, defaults to 1.
      # - `limit` (optional): Size of a page, defaults to 10. Maximum is 100.
      #
      # **Returns:** Polar::Models::ListResource(Polar::Models::LicenseKeyRead)
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def list(organization_id : String? = nil, benefit_id : String? = nil, page : Int32? = nil, limit : Int32? = nil) : Polar::Models::ListResource(Polar::Models::LicenseKeyRead)
        Log.debug { "Calling list" }
        url = "/v1/license-keys/"
        query_params = {} of String => String
        query_params["organization_id"] = organization_id.to_s if organization_id
        query_params["benefit_id"] = benefit_id.to_s if benefit_id
        query_params["page"] = page.to_s if page
        query_params["limit"] = limit.to_s if limit
        url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
        Log.trace { "Query params: #{query_params}" }
        response = @client.request("GET", url)
        result = Polar::Models::ListResource(Polar::Models::LicenseKeyRead).from_json(response)
        Log.debug { "list completed successfully" }
        result
      end

      # Get License Key
      #
      # Get a license key.
      #
      # Scopes: license_keys:read license_keys:write
      #
      # **Endpoint:** `GET /v1/license-keys/{id}`
      #
      # **Parameters:**
      # - `id` (required): Path parameter
      #
      # **Returns:** Polar::Models::LicenseKeyWithActivations
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def get(id : String) : Polar::Models::LicenseKeyWithActivations
        Log.debug { "Calling get" }
        url = "/v1/license-keys/#{id}"
        response = @client.request("GET", url)
        result = Polar::Models::LicenseKeyWithActivations.from_json(response)
        Log.debug { "get completed successfully" }
        result
      end

      # Update License Key
      #
      # Update a license key.
      #
      # Scopes: license_keys:write
      #
      # **Endpoint:** `PATCH /v1/license-keys/{id}`
      #
      # **Parameters:**
      # - `id` (required): Path parameter
      # - `body` (required): Request body as Polar::Models::LicenseKeyUpdate
      #
      # **Returns:** Polar::Models::LicenseKeyRead
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def update(id : String, body : Polar::Models::LicenseKeyUpdate) : Polar::Models::LicenseKeyRead
        Log.debug { "Calling update" }
        url = "/v1/license-keys/#{id}"
        response = @client.request("PATCH", url, body: body.to_json)
        result = Polar::Models::LicenseKeyRead.from_json(response)
        Log.debug { "update completed successfully" }
        result
      end

      # Get Activation
      #
      # Get a license key activation.
      #
      # Scopes: license_keys:read license_keys:write
      #
      # **Endpoint:** `GET /v1/license-keys/{id}/activations/{activation_id}`
      #
      # **Parameters:**
      # - `id` (required): Path parameter
      # - `activation_id` (required): Path parameter
      #
      # **Returns:** Polar::Models::LicenseKeyActivationRead
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def get_activation(id : String, activation_id : String) : Polar::Models::LicenseKeyActivationRead
        Log.debug { "Calling get_activation" }
        url = "/v1/license-keys/#{id}/activations/#{activation_id}"
        response = @client.request("GET", url)
        result = Polar::Models::LicenseKeyActivationRead.from_json(response)
        Log.debug { "get_activation completed successfully" }
        result
      end

      # Validate License Key
      #
      # Validate a license key.
      #
      # Scopes: license_keys:write
      #
      # **Endpoint:** `POST /v1/license-keys/validate`
      #
      # **Parameters:**
      # - `body` (required): Request body as Polar::Models::LicenseKeyValidate
      #
      # **Returns:** Polar::Models::ValidatedLicenseKey
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def validate(body : Polar::Models::LicenseKeyValidate) : Polar::Models::ValidatedLicenseKey
        Log.debug { "Calling validate" }
        url = "/v1/license-keys/validate"
        response = @client.request("POST", url, body: body.to_json)
        result = Polar::Models::ValidatedLicenseKey.from_json(response)
        Log.debug { "validate completed successfully" }
        result
      end

      # Activate License Key
      #
      # Activate a license key instance.
      #
      # Scopes: license_keys:write
      #
      # **Endpoint:** `POST /v1/license-keys/activate`
      #
      # **Parameters:**
      # - `body` (required): Request body as Polar::Models::LicenseKeyActivate
      #
      # **Returns:** Polar::Models::LicenseKeyActivationRead
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def activate(body : Polar::Models::LicenseKeyActivate) : Polar::Models::LicenseKeyActivationRead
        Log.debug { "Calling activate" }
        url = "/v1/license-keys/activate"
        response = @client.request("POST", url, body: body.to_json)
        result = Polar::Models::LicenseKeyActivationRead.from_json(response)
        Log.debug { "activate completed successfully" }
        result
      end

      # Deactivate License Key
      #
      # Deactivate a license key instance.
      #
      # Scopes: license_keys:write
      #
      # **Endpoint:** `POST /v1/license-keys/deactivate`
      #
      # **Parameters:**
      # - `body` (required): Request body as Polar::Models::LicenseKeyDeactivate
      #
      # **Returns:** JSON response string
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def deactivate(body : Polar::Models::LicenseKeyDeactivate)
        Log.debug { "Calling deactivate" }
        url = "/v1/license-keys/deactivate"
        response = @client.request("POST", url, body: body.to_json)
        Log.debug { "deactivate completed successfully" }
        response
      end
    end
  end

  # Extend Client class with license_keys API accessor
  class Client
    # Access the license_keys API
    #
    # @return [Api::LicenseKeys] The license_keys API client
    def license_keys : Api::LicenseKeys
      Api::LicenseKeys.new(self)
    end
  end
end
