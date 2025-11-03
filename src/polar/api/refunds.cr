# Refunds
#
# API client for refunds resource operations.
#
# This class provides methods for interacting with refunds-related endpoints
# in the Polar.sh API. All methods return JSON response strings that can be
# parsed into appropriate model types.
#
# Auto-generated from OpenAPI spec
module Polar
  module Api
    # API client for refunds operations
    class Refunds
      Log = ::Log.for(self)

      # Creates a new Refunds instance
      #
      # @param client [Client] The Polar API client instance
      def initialize(@client : Client)
        Log.debug { "Initialized Refunds API client" }
      end

      # List Refunds
      #
      # List products.
      #
      # Scopes: refunds:read refunds:write
      #
      # **Endpoint:** `GET /v1/refunds/`
      #
      # **Parameters:**
      # - `id` (optional): Filter by refund ID.
      # - `organization_id` (optional): Filter by organization ID.
      # - `order_id` (optional): Filter by order ID.
      # - `subscription_id` (optional): Filter by subscription ID.
      # - `customer_id` (optional): Filter by customer ID.
      # - `succeeded` (optional): Filter by succeeded.
      # - `page` (optional): Page number, defaults to 1.
      # - `limit` (optional): Size of a page, defaults to 10. Maximum is 100.
      # - `sorting` (optional): Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign - before the criteria name to sort by descending order.
      #
      # **Returns:** Polar::Models::ListResource(Polar::Models::Refund)
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def list(id : String? = nil, organization_id : String? = nil, order_id : String? = nil, subscription_id : String? = nil, customer_id : String? = nil, succeeded : String? = nil, page : Int32? = nil, limit : Int32? = nil, sorting : String? = nil) : Polar::Models::ListResource(Polar::Models::Refund)
        Log.debug { "Calling list" }
        url = "/v1/refunds/"
        query_params = {} of String => String
        query_params["id"] = id.to_s if id
        query_params["organization_id"] = organization_id.to_s if organization_id
        query_params["order_id"] = order_id.to_s if order_id
        query_params["subscription_id"] = subscription_id.to_s if subscription_id
        query_params["customer_id"] = customer_id.to_s if customer_id
        query_params["succeeded"] = succeeded.to_s if succeeded
        query_params["page"] = page.to_s if page
        query_params["limit"] = limit.to_s if limit
        query_params["sorting"] = sorting.to_s if sorting
        url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
        Log.trace { "Query params: #{query_params}" }
        response = @client.request("GET", url)
        result = Polar::Models::ListResource(Polar::Models::Refund).from_json(response)
        Log.debug { "list completed successfully" }
        result
      end

      # Create Refund
      #
      # Create a refund.
      #
      # Scopes: refunds:write
      #
      # **Endpoint:** `POST /v1/refunds/`
      #
      # **Parameters:**
      # - `body` (required): Request body as Polar::Models::RefundCreate
      #
      # **Returns:** Polar::Models::Refund
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def create(body : Polar::Models::RefundCreate) : Polar::Models::Refund
        Log.debug { "Calling create" }
        url = "/v1/refunds/"
        response = @client.request("POST", url, body: body.to_json)
        result = Polar::Models::Refund.from_json(response)
        Log.debug { "create completed successfully" }
        result
      end
    end
  end

  # Extend Client class with refunds API accessor
  class Client
    # Access the refunds API
    #
    # @return [Api::Refunds] The refunds API client
    def refunds : Api::Refunds
      Api::Refunds.new(self)
    end
  end
end
