# Benefits
#
# API client for benefits resource operations.
#
# This class provides methods for interacting with benefits-related endpoints
# in the Polar.sh API. All methods return JSON response strings that can be
# parsed into appropriate model types.
#
# Auto-generated from OpenAPI spec
module Polar
  module Api
    # API client for benefits operations
    class Benefits
      Log = ::Log.for(self)

      # Creates a new Benefits instance
      #
      # @param client [Client] The Polar API client instance
      def initialize(@client : Client)
        Log.debug { "Initialized Benefits API client" }
      end

      # List Benefits
      #
      # List benefits.
      #
      # Scopes: benefits:read benefits:write
      #
      # **Endpoint:** `GET /v1/benefits/`
      #
      # **Parameters:**
      # - `organization_id` (optional): Filter by organization ID.
      # - `type` (optional): Filter by benefit type.
      # - `query` (optional): Filter by description.
      # - `page` (optional): Page number, defaults to 1.
      # - `limit` (optional): Size of a page, defaults to 10. Maximum is 100.
      # - `sorting` (optional): Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign - before the criteria name to sort by descending order.
      # - `metadata` (optional): Filter by metadata key-value pairs. It uses the deepObject style, e.g. ?metadata[key]=value.
      #
      # **Returns:** Polar::Models::ListResource(Polar::Models::Benefit)
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def list(organization_id : String? = nil, type : String? = nil, query : String? = nil, page : Int32? = nil, limit : Int32? = nil, sorting : String? = nil, metadata : String? = nil) : Polar::Models::ListResource(Polar::Models::Benefit)
        Log.debug { "Calling list" }
        url = "/v1/benefits/"
        query_params = {} of String => String
        query_params["organization_id"] = organization_id.to_s if organization_id
        query_params["type"] = type.to_s if type
        query_params["query"] = query.to_s if query
        query_params["page"] = page.to_s if page
        query_params["limit"] = limit.to_s if limit
        query_params["sorting"] = sorting.to_s if sorting
        query_params["metadata"] = metadata.to_s if metadata
        url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
        Log.trace { "Query params: #{query_params}" }
        response = @client.request("GET", url)
        result = Polar::Models::ListResource(Polar::Models::Benefit).from_json(response)
        Log.debug { "list completed successfully" }
        result
      end

      # Create Benefit
      #
      # Create a benefit.
      #
      # Scopes: benefits:write
      #
      # **Endpoint:** `POST /v1/benefits/`
      #
      # **Parameters:**
      # - `body` (required): Request body as Polar::Models::BenefitCreate
      #
      # **Returns:** Polar::Models::Benefit
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def create(body : Polar::Models::BenefitCreate) : Polar::Models::Benefit
        Log.debug { "Calling create" }
        url = "/v1/benefits/"
        response = @client.request("POST", url, body: body.to_json)
        result = Polar::Models::Benefit.from_json(response)
        Log.debug { "create completed successfully" }
        result
      end

      # Get Benefit
      #
      # Get a benefit by ID.
      #
      # Scopes: benefits:read benefits:write
      #
      # **Endpoint:** `GET /v1/benefits/{id}`
      #
      # **Parameters:**
      # - `id` (required): Path parameter
      #
      # **Returns:** Polar::Models::Benefit
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def get(id : String) : Polar::Models::Benefit
        Log.debug { "Calling get" }
        url = "/v1/benefits/#{id}"
        response = @client.request("GET", url)
        result = Polar::Models::Benefit.from_json(response)
        Log.debug { "get completed successfully" }
        result
      end

      # Update Benefit
      #
      # Update a benefit.
      #
      # Scopes: benefits:write
      #
      # **Endpoint:** `PATCH /v1/benefits/{id}`
      #
      # **Parameters:**
      # - `id` (required): Path parameter
      # - `body` (required): Request body as Polar::Models::BenefitCustomUpdate
      #
      # **Returns:** Polar::Models::Benefit
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def update(id : String, body : Polar::Models::BenefitCustomUpdate) : Polar::Models::Benefit
        Log.debug { "Calling update" }
        url = "/v1/benefits/#{id}"
        response = @client.request("PATCH", url, body: body.to_json)
        result = Polar::Models::Benefit.from_json(response)
        Log.debug { "update completed successfully" }
        result
      end

      # Delete Benefit
      #
      # Delete a benefit.
      #
      # > [!WARNING]
      # > Every grants associated with the benefit will be revoked.
      # > Users will lose access to the benefit.
      #
      # Scopes: benefits:write
      #
      # **Endpoint:** `DELETE /v1/benefits/{id}`
      #
      # **Parameters:**
      # - `id` (required): Path parameter
      #
      # **Returns:** JSON response string
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def delete(id : String)
        Log.debug { "Calling delete" }
        url = "/v1/benefits/#{id}"
        response = @client.request("DELETE", url)
        Log.debug { "delete completed successfully" }
        response
      end

      # List Benefit Grants
      #
      # List the individual grants for a benefit.
      #
      # It's especially useful to check if a user has been granted a benefit.
      #
      # Scopes: benefits:read benefits:write
      #
      # **Endpoint:** `GET /v1/benefits/{id}/grants`
      #
      # **Parameters:**
      # - `id` (required): Path parameter
      # - `is_granted` (optional): Filter by granted status. If true, only granted benefits will be returned. If false, only revoked benefits will be returned.
      # - `customer_id` (optional): Filter by customer.
      # - `page` (optional): Page number, defaults to 1.
      # - `limit` (optional): Size of a page, defaults to 10. Maximum is 100.
      #
      # **Returns:** Polar::Models::ListResource(Polar::Models::BenefitGrant)
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def grants(id : String, is_granted : String? = nil, customer_id : String? = nil, page : Int32? = nil, limit : Int32? = nil) : Polar::Models::ListResource(Polar::Models::BenefitGrant)
        Log.debug { "Calling grants" }
        url = "/v1/benefits/#{id}/grants"
        query_params = {} of String => String
        query_params["is_granted"] = is_granted.to_s if is_granted
        query_params["customer_id"] = customer_id.to_s if customer_id
        query_params["page"] = page.to_s if page
        query_params["limit"] = limit.to_s if limit
        url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
        Log.trace { "Query params: #{query_params}" }
        response = @client.request("GET", url)
        result = Polar::Models::ListResource(Polar::Models::BenefitGrant).from_json(response)
        Log.debug { "grants completed successfully" }
        result
      end
    end
  end

  # Extend Client class with benefits API accessor
  class Client
    # Access the benefits API
    #
    # @return [Api::Benefits] The benefits API client
    def benefits : Api::Benefits
      Api::Benefits.new(self)
    end
  end
end
