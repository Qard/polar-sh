# Products
#
# API client for products resource operations.
#
# This class provides methods for interacting with products-related endpoints
# in the Polar.sh API. All methods return JSON response strings that can be
# parsed into appropriate model types.
#
# Auto-generated from OpenAPI spec
module Polar
  module Api
    # API client for products operations
    class Products
      Log = ::Log.for(self)

      # Creates a new Products instance
      #
      # @param client [Client] The Polar API client instance
      def initialize(@client : Client)
        Log.debug { "Initialized Products API client" }
      end

      # List Products
      #
      # List products.
      #
      # Scopes: products:read products:write
      #
      # **Endpoint:** `GET /v1/products/`
      #
      # **Parameters:**
      # - `id` (optional): Filter by product ID.
      # - `organization_id` (optional): Filter by organization ID.
      # - `query` (optional): Filter by product name.
      # - `is_archived` (optional): Filter on archived products.
      # - `is_recurring` (optional): Filter on recurring products. If true, only subscriptions tiers are returned. If false, only one-time purchase products are returned.
      # - `benefit_id` (optional): Filter products granting specific benefit.
      # - `page` (optional): Page number, defaults to 1.
      # - `limit` (optional): Size of a page, defaults to 10. Maximum is 100.
      # - `sorting` (optional): Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign - before the criteria name to sort by descending order.
      # - `metadata` (optional): Filter by metadata key-value pairs. It uses the deepObject style, e.g. ?metadata[key]=value.
      #
      # **Returns:** Polar::Models::ListResource(Polar::Models::Product)
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def list(id : String? = nil, organization_id : String? = nil, query : String? = nil, is_archived : String? = nil, is_recurring : String? = nil, benefit_id : String? = nil, page : Int32? = nil, limit : Int32? = nil, sorting : String? = nil, metadata : String? = nil) : Polar::Models::ListResource(Polar::Models::Product)
        Log.debug { "Calling list" }
        url = "/v1/products/"
        query_params = {} of String => String
        query_params["id"] = id.to_s if id
        query_params["organization_id"] = organization_id.to_s if organization_id
        query_params["query"] = query.to_s if query
        query_params["is_archived"] = is_archived.to_s if is_archived
        query_params["is_recurring"] = is_recurring.to_s if is_recurring
        query_params["benefit_id"] = benefit_id.to_s if benefit_id
        query_params["page"] = page.to_s if page
        query_params["limit"] = limit.to_s if limit
        query_params["sorting"] = sorting.to_s if sorting
        query_params["metadata"] = metadata.to_s if metadata
        url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
        Log.trace { "Query params: #{query_params}" }
        response = @client.request("GET", url)
        result = Polar::Models::ListResource(Polar::Models::Product).from_json(response)
        Log.debug { "list completed successfully" }
        result
      end

      # Create Product
      #
      # Create a product.
      #
      # Scopes: products:write
      #
      # **Endpoint:** `POST /v1/products/`
      #
      # **Parameters:**
      # - `body` (required): Request body as Polar::Models::ProductCreate
      #
      # **Returns:** Polar::Models::Product
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def create(body : Polar::Models::ProductCreate) : Polar::Models::Product
        Log.debug { "Calling create" }
        url = "/v1/products/"
        response = @client.request("POST", url, body: body.to_json)
        result = Polar::Models::Product.from_json(response)
        Log.debug { "create completed successfully" }
        result
      end

      # Get Product
      #
      # Get a product by ID.
      #
      # Scopes: products:read products:write
      #
      # **Endpoint:** `GET /v1/products/{id}`
      #
      # **Parameters:**
      # - `id` (required): Path parameter
      #
      # **Returns:** Polar::Models::Product
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def get(id : String) : Polar::Models::Product
        Log.debug { "Calling get" }
        url = "/v1/products/#{id}"
        response = @client.request("GET", url)
        result = Polar::Models::Product.from_json(response)
        Log.debug { "get completed successfully" }
        result
      end

      # Update Product
      #
      # Update a product.
      #
      # Scopes: products:write
      #
      # **Endpoint:** `PATCH /v1/products/{id}`
      #
      # **Parameters:**
      # - `id` (required): Path parameter
      # - `body` (required): Request body as Polar::Models::ProductUpdate
      #
      # **Returns:** Polar::Models::Product
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def update(id : String, body : Polar::Models::ProductUpdate) : Polar::Models::Product
        Log.debug { "Calling update" }
        url = "/v1/products/#{id}"
        response = @client.request("PATCH", url, body: body.to_json)
        result = Polar::Models::Product.from_json(response)
        Log.debug { "update completed successfully" }
        result
      end

      # Update Product Benefits
      #
      # Update benefits granted by a product.
      #
      # Scopes: products:write
      #
      # **Endpoint:** `POST /v1/products/{id}/benefits`
      #
      # **Parameters:**
      # - `id` (required): Path parameter
      # - `body` (required): Request body as Polar::Models::ProductBenefitsUpdate
      #
      # **Returns:** Polar::Models::Product
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def update_benefits(id : String, body : Polar::Models::ProductBenefitsUpdate) : Polar::Models::Product
        Log.debug { "Calling update_benefits" }
        url = "/v1/products/#{id}/benefits"
        response = @client.request("POST", url, body: body.to_json)
        result = Polar::Models::Product.from_json(response)
        Log.debug { "update_benefits completed successfully" }
        result
      end
    end
  end

  # Extend Client class with products API accessor
  class Client
    # Access the products API
    #
    # @return [Api::Products] The products API client
    def products : Api::Products
      Api::Products.new(self)
    end
  end
end
