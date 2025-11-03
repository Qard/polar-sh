# CustomerMeters
#
# API client for customer_meters resource operations.
#
# This class provides methods for interacting with customer_meters-related endpoints
# in the Polar.sh API. All methods return JSON response strings that can be
# parsed into appropriate model types.
#
# Auto-generated from OpenAPI spec
module Polar
  module Api
    # API client for customer_meters operations
    class CustomerMeters
      Log = ::Log.for(self)

      # Creates a new CustomerMeters instance
      #
      # @param client [Client] The Polar API client instance
      def initialize(@client : Client)
        Log.debug { "Initialized CustomerMeters API client" }
      end

      # List Customer Meters
      #
      # List customer meters.
      #
      # Scopes: customer_meters:read
      #
      # **Endpoint:** `GET /v1/customer-meters/`
      #
      # **Parameters:**
      # - `organization_id` (optional): Filter by organization ID.
      # - `customer_id` (optional): Filter by customer ID.
      # - `external_customer_id` (optional): Filter by external customer ID.
      # - `meter_id` (optional): Filter by meter ID.
      # - `page` (optional): Page number, defaults to 1.
      # - `limit` (optional): Size of a page, defaults to 10. Maximum is 100.
      # - `sorting` (optional): Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign - before the criteria name to sort by descending order.
      #
      # **Returns:** Polar::Models::ListResource(Polar::Models::CustomerMeter)
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def list(organization_id : String? = nil, customer_id : String? = nil, external_customer_id : String? = nil, meter_id : String? = nil, page : Int32? = nil, limit : Int32? = nil, sorting : String? = nil) : Polar::Models::ListResource(Polar::Models::CustomerMeter)
        Log.debug { "Calling list" }
        url = "/v1/customer-meters/"
        query_params = {} of String => String
        query_params["organization_id"] = organization_id.to_s if organization_id
        query_params["customer_id"] = customer_id.to_s if customer_id
        query_params["external_customer_id"] = external_customer_id.to_s if external_customer_id
        query_params["meter_id"] = meter_id.to_s if meter_id
        query_params["page"] = page.to_s if page
        query_params["limit"] = limit.to_s if limit
        query_params["sorting"] = sorting.to_s if sorting
        url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
        Log.trace { "Query params: #{query_params}" }
        response = @client.request("GET", url)
        result = Polar::Models::ListResource(Polar::Models::CustomerMeter).from_json(response)
        Log.debug { "list completed successfully" }
        result
      end

      # Get Customer Meter
      #
      # Get a customer meter by ID.
      #
      # Scopes: customer_meters:read
      #
      # **Endpoint:** `GET /v1/customer-meters/{id}`
      #
      # **Parameters:**
      # - `id` (required): The customer meter ID.
      #
      # **Returns:** Polar::Models::CustomerMeter
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def get(id : String) : Polar::Models::CustomerMeter
        Log.debug { "Calling get" }
        url = "/v1/customer-meters/#{id}"
        response = @client.request("GET", url)
        result = Polar::Models::CustomerMeter.from_json(response)
        Log.debug { "get completed successfully" }
        result
      end
    end
  end

  # Extend Client class with customer_meters API accessor
  class Client
    # Access the customer_meters API
    #
    # @return [Api::CustomerMeters] The customer_meters API client
    def customer_meters : Api::CustomerMeters
      Api::CustomerMeters.new(self)
    end
  end
end
