# Orders
#
# API client for orders resource operations.
#
# This class provides methods for interacting with orders-related endpoints
# in the Polar.sh API. All methods return JSON response strings that can be
# parsed into appropriate model types.
#
# Auto-generated from OpenAPI spec
module Polar
  module Api
    # API client for orders operations
    class Orders
      Log = ::Log.for(self)

      # Creates a new Orders instance
      #
      # @param client [Client] The Polar API client instance
      def initialize(@client : Client)
        Log.debug { "Initialized Orders API client" }
      end

      # List Orders
      #
      # List orders.
      #
      # Scopes: orders:read
      #
      # **Endpoint:** `GET /v1/orders/`
      #
      # **Parameters:**
      # - `organization_id` (optional): Filter by organization ID.
      # - `product_id` (optional): Filter by product ID.
      # - `product_billing_type` (optional): Filter by product billing type. recurring will filter data corresponding to subscriptions creations or renewals. one_time will filter data corresponding to one-time purchases.
      # - `discount_id` (optional): Filter by discount ID.
      # - `customer_id` (optional): Filter by customer ID.
      # - `checkout_id` (optional): Filter by checkout ID.
      # - `page` (optional): Page number, defaults to 1.
      # - `limit` (optional): Size of a page, defaults to 10. Maximum is 100.
      # - `sorting` (optional): Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign - before the criteria name to sort by descending order.
      # - `metadata` (optional): Filter by metadata key-value pairs. It uses the deepObject style, e.g. ?metadata[key]=value.
      #
      # **Returns:** Polar::Models::ListResource(Polar::Models::Order)
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def list(organization_id : String? = nil, product_id : String? = nil, product_billing_type : String? = nil, discount_id : String? = nil, customer_id : String? = nil, checkout_id : String? = nil, page : Int32? = nil, limit : Int32? = nil, sorting : String? = nil, metadata : String? = nil) : Polar::Models::ListResource(Polar::Models::Order)
        Log.debug { "Calling list" }
        url = "/v1/orders/"
        query_params = {} of String => String
        query_params["organization_id"] = organization_id.to_s if organization_id
        query_params["product_id"] = product_id.to_s if product_id
        query_params["product_billing_type"] = product_billing_type.to_s if product_billing_type
        query_params["discount_id"] = discount_id.to_s if discount_id
        query_params["customer_id"] = customer_id.to_s if customer_id
        query_params["checkout_id"] = checkout_id.to_s if checkout_id
        query_params["page"] = page.to_s if page
        query_params["limit"] = limit.to_s if limit
        query_params["sorting"] = sorting.to_s if sorting
        query_params["metadata"] = metadata.to_s if metadata
        url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
        Log.trace { "Query params: #{query_params}" }
        response = @client.request("GET", url)
        result = Polar::Models::ListResource(Polar::Models::Order).from_json(response)
        Log.debug { "list completed successfully" }
        result
      end

      # Export Subscriptions
      #
      # Export orders as a CSV file.
      #
      # Scopes: orders:read
      #
      # **Endpoint:** `GET /v1/orders/export`
      #
      # **Parameters:**
      # - `organization_id` (optional): Filter by organization ID.
      # - `product_id` (optional): Filter by product ID.
      #
      # **Returns:** JSON response string
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def export(organization_id : String? = nil, product_id : String? = nil)
        Log.debug { "Calling export" }
        url = "/v1/orders/export"
        query_params = {} of String => String
        query_params["organization_id"] = organization_id.to_s if organization_id
        query_params["product_id"] = product_id.to_s if product_id
        url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
        Log.trace { "Query params: #{query_params}" }
        response = @client.request("GET", url)
        Log.debug { "export completed successfully" }
        response
      end

      # Get Order
      #
      # Get an order by ID.
      #
      # Scopes: orders:read
      #
      # **Endpoint:** `GET /v1/orders/{id}`
      #
      # **Parameters:**
      # - `id` (required): The order ID.
      #
      # **Returns:** Polar::Models::Order
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def get(id : String) : Polar::Models::Order
        Log.debug { "Calling get" }
        url = "/v1/orders/#{id}"
        response = @client.request("GET", url)
        result = Polar::Models::Order.from_json(response)
        Log.debug { "get completed successfully" }
        result
      end

      # Update Order
      #
      # Update an order.
      #
      # Scopes: orders:write
      #
      # **Endpoint:** `PATCH /v1/orders/{id}`
      #
      # **Parameters:**
      # - `id` (required): The order ID.
      # - `body` (required): Request body as Polar::Models::OrderUpdate
      #
      # **Returns:** Polar::Models::Order
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def update(id : String, body : Polar::Models::OrderUpdate) : Polar::Models::Order
        Log.debug { "Calling update" }
        url = "/v1/orders/#{id}"
        response = @client.request("PATCH", url, body: body.to_json)
        result = Polar::Models::Order.from_json(response)
        Log.debug { "update completed successfully" }
        result
      end

      # Generate Order Invoice
      #
      # Trigger generation of an order's invoice.
      #
      # Scopes: orders:read
      #
      # **Endpoint:** `POST /v1/orders/{id}/invoice`
      #
      # **Parameters:**
      # - `id` (required): The order ID.
      #
      # **Returns:** JSON response string
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def generate_invoice(id : String)
        Log.debug { "Calling generate_invoice" }
        url = "/v1/orders/#{id}/invoice"
        response = @client.request("POST", url)
        Log.debug { "generate_invoice completed successfully" }
        response
      end

      # Get Order Invoice
      #
      # Get an order's invoice data.
      #
      # Scopes: orders:read
      #
      # **Endpoint:** `GET /v1/orders/{id}/invoice`
      #
      # **Parameters:**
      # - `id` (required): The order ID.
      #
      # **Returns:** Polar::Models::OrderInvoice
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def invoice(id : String) : Polar::Models::OrderInvoice
        Log.debug { "Calling invoice" }
        url = "/v1/orders/#{id}/invoice"
        response = @client.request("GET", url)
        result = Polar::Models::OrderInvoice.from_json(response)
        Log.debug { "invoice completed successfully" }
        result
      end
    end
  end

  # Extend Client class with orders API accessor
  class Client
    # Access the orders API
    #
    # @return [Api::Orders] The orders API client
    def orders : Api::Orders
      Api::Orders.new(self)
    end
  end
end
