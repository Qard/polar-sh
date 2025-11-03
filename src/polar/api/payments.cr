# Payments
#
# API client for payments resource operations.
#
# This class provides methods for interacting with payments-related endpoints
# in the Polar.sh API. All methods return JSON response strings that can be
# parsed into appropriate model types.
#
# Auto-generated from OpenAPI spec
module Polar
  module Api
    # API client for payments operations
    class Payments
      Log = ::Log.for(self)

      # Creates a new Payments instance
      #
      # @param client [Client] The Polar API client instance
      def initialize(@client : Client)
        Log.debug { "Initialized Payments API client" }
      end

      # List Payments
      #
      # List payments.
      #
      # Scopes: payments:read
      #
      # **Endpoint:** `GET /v1/payments/`
      #
      # **Parameters:**
      # - `organization_id` (optional): Filter by organization ID.
      # - `checkout_id` (optional): Filter by checkout ID.
      # - `order_id` (optional): Filter by order ID.
      # - `status` (optional): Filter by payment status.
      # - `method` (optional): Filter by payment method.
      # - `customer_email` (optional): Filter by customer email.
      # - `page` (optional): Page number, defaults to 1.
      # - `limit` (optional): Size of a page, defaults to 10. Maximum is 100.
      # - `sorting` (optional): Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign - before the criteria name to sort by descending order.
      #
      # **Returns:** Polar::Models::ListResource(Polar::Models::Payment)
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def list(organization_id : String? = nil, checkout_id : String? = nil, order_id : String? = nil, status : String? = nil, method : String? = nil, customer_email : String? = nil, page : Int32? = nil, limit : Int32? = nil, sorting : String? = nil) : Polar::Models::ListResource(Polar::Models::Payment)
        Log.debug { "Calling list" }
        url = "/v1/payments/"
        query_params = {} of String => String
        query_params["organization_id"] = organization_id.to_s if organization_id
        query_params["checkout_id"] = checkout_id.to_s if checkout_id
        query_params["order_id"] = order_id.to_s if order_id
        query_params["status"] = status.to_s if status
        query_params["method"] = method.to_s if method
        query_params["customer_email"] = customer_email.to_s if customer_email
        query_params["page"] = page.to_s if page
        query_params["limit"] = limit.to_s if limit
        query_params["sorting"] = sorting.to_s if sorting
        url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
        Log.trace { "Query params: #{query_params}" }
        response = @client.request("GET", url)
        result = Polar::Models::ListResource(Polar::Models::Payment).from_json(response)
        Log.debug { "list completed successfully" }
        result
      end

      # Get Payment
      #
      # Get a payment by ID.
      #
      # Scopes: payments:read
      #
      # **Endpoint:** `GET /v1/payments/{id}`
      #
      # **Parameters:**
      # - `id` (required): The payment ID.
      #
      # **Returns:** Polar::Models::Payment
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def get(id : String) : Polar::Models::Payment
        Log.debug { "Calling get" }
        url = "/v1/payments/#{id}"
        response = @client.request("GET", url)
        result = Polar::Models::Payment.from_json(response)
        Log.debug { "get completed successfully" }
        result
      end
    end
  end

  # Extend Client class with payments API accessor
  class Client
    # Access the payments API
    #
    # @return [Api::Payments] The payments API client
    def payments : Api::Payments
      Api::Payments.new(self)
    end
  end
end
