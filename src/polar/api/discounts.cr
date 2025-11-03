# Discounts
#
# API client for discounts resource operations.
#
# This class provides methods for interacting with discounts-related endpoints
# in the Polar.sh API. All methods return JSON response strings that can be
# parsed into appropriate model types.
#
# Auto-generated from OpenAPI spec
module Polar
  module Api
    # API client for discounts operations
    class Discounts
      Log = ::Log.for(self)

      # Creates a new Discounts instance
      #
      # @param client [Client] The Polar API client instance
      def initialize(@client : Client)
        Log.debug { "Initialized Discounts API client" }
      end

      # List Discounts
      #
      # List discounts.
      #
      # Scopes: discounts:read discounts:write
      #
      # **Endpoint:** `GET /v1/discounts/`
      #
      # **Parameters:**
      # - `organization_id` (optional): Filter by organization ID.
      # - `query` (optional): Filter by name.
      # - `page` (optional): Page number, defaults to 1.
      # - `limit` (optional): Size of a page, defaults to 10. Maximum is 100.
      # - `sorting` (optional): Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign - before the criteria name to sort by descending order.
      #
      # **Returns:** Polar::Models::ListResource(Polar::Models::Discount)
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def list(organization_id : String? = nil, query : String? = nil, page : Int32? = nil, limit : Int32? = nil, sorting : String? = nil) : Polar::Models::ListResource(Polar::Models::Discount)
        Log.debug { "Calling list" }
        url = "/v1/discounts/"
        query_params = {} of String => String
        query_params["organization_id"] = organization_id.to_s if organization_id
        query_params["query"] = query.to_s if query
        query_params["page"] = page.to_s if page
        query_params["limit"] = limit.to_s if limit
        query_params["sorting"] = sorting.to_s if sorting
        url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
        Log.trace { "Query params: #{query_params}" }
        response = @client.request("GET", url)
        result = Polar::Models::ListResource(Polar::Models::Discount).from_json(response)
        Log.debug { "list completed successfully" }
        result
      end

      # Create Discount
      #
      # Create a discount.
      #
      # Scopes: discounts:write
      #
      # **Endpoint:** `POST /v1/discounts/`
      #
      # **Parameters:**
      # - `body` (required): Request body as Polar::Models::DiscountCreate
      #
      # **Returns:** Polar::Models::Discount
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def create(body : Polar::Models::DiscountCreate) : Polar::Models::Discount
        Log.debug { "Calling create" }
        url = "/v1/discounts/"
        response = @client.request("POST", url, body: body.to_json)
        result = Polar::Models::Discount.from_json(response)
        Log.debug { "create completed successfully" }
        result
      end

      # Get Discount
      #
      # Get a discount by ID.
      #
      # Scopes: discounts:read discounts:write
      #
      # **Endpoint:** `GET /v1/discounts/{id}`
      #
      # **Parameters:**
      # - `id` (required): The discount ID.
      #
      # **Returns:** Polar::Models::Discount
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def get(id : String) : Polar::Models::Discount
        Log.debug { "Calling get" }
        url = "/v1/discounts/#{id}"
        response = @client.request("GET", url)
        result = Polar::Models::Discount.from_json(response)
        Log.debug { "get completed successfully" }
        result
      end

      # Update Discount
      #
      # Update a discount.
      #
      # Scopes: discounts:write
      #
      # **Endpoint:** `PATCH /v1/discounts/{id}`
      #
      # **Parameters:**
      # - `id` (required): The discount ID.
      # - `body` (required): Request body as Polar::Models::DiscountUpdate
      #
      # **Returns:** Polar::Models::Discount
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def update(id : String, body : Polar::Models::DiscountUpdate) : Polar::Models::Discount
        Log.debug { "Calling update" }
        url = "/v1/discounts/#{id}"
        response = @client.request("PATCH", url, body: body.to_json)
        result = Polar::Models::Discount.from_json(response)
        Log.debug { "update completed successfully" }
        result
      end

      # Delete Discount
      #
      # Delete a discount.
      #
      # Scopes: discounts:write
      #
      # **Endpoint:** `DELETE /v1/discounts/{id}`
      #
      # **Parameters:**
      # - `id` (required): The discount ID.
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
        url = "/v1/discounts/#{id}"
        response = @client.request("DELETE", url)
        Log.debug { "delete completed successfully" }
        response
      end
    end
  end

  # Extend Client class with discounts API accessor
  class Client
    # Access the discounts API
    #
    # @return [Api::Discounts] The discounts API client
    def discounts : Api::Discounts
      Api::Discounts.new(self)
    end
  end
end
