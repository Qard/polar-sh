# Metrics
#
# API client for metrics resource operations.
#
# This class provides methods for interacting with metrics-related endpoints
# in the Polar.sh API. All methods return JSON response strings that can be
# parsed into appropriate model types.
#
# Auto-generated from OpenAPI spec
module Polar
  module Api
    # API client for metrics operations
    class Metrics
      Log = ::Log.for(self)

      # Creates a new Metrics instance
      #
      # @param client [Client] The Polar API client instance
      def initialize(@client : Client)
        Log.debug { "Initialized Metrics API client" }
      end

      # Get Metrics
      #
      # Get metrics about your orders and subscriptions.
      #
      # Currency values are output in cents.
      #
      # Scopes: metrics:read
      #
      # **Endpoint:** `GET /v1/metrics/`
      #
      # **Parameters:**
      # - `start_date` (required): Start date.
      # - `end_date` (required): End date.
      # - `timezone` (optional): Timezone to use for the timestamps. Default is UTC.
      # - `interval` (required): Interval between two timestamps.
      # - `organization_id` (optional): Filter by organization ID.
      # - `product_id` (optional): Filter by product ID.
      # - `billing_type` (optional): Filter by billing type. recurring will filter data corresponding to subscriptions creations or renewals. one_time will filter data corresponding to one-time purchases.
      # - `customer_id` (optional): Filter by customer ID.
      #
      # **Returns:** Polar::Models::MetricsResponse
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def get(start_date : String, end_date : String, interval : String, timezone : String? = nil, organization_id : String? = nil, product_id : String? = nil, billing_type : String? = nil, customer_id : String? = nil) : Polar::Models::MetricsResponse
        Log.debug { "Calling get" }
        url = "/v1/metrics/"
        query_params = {} of String => String
        query_params["start_date"] = start_date.to_s if start_date
        query_params["end_date"] = end_date.to_s if end_date
        query_params["timezone"] = timezone.to_s if timezone
        query_params["interval"] = interval.to_s if interval
        query_params["organization_id"] = organization_id.to_s if organization_id
        query_params["product_id"] = product_id.to_s if product_id
        query_params["billing_type"] = billing_type.to_s if billing_type
        query_params["customer_id"] = customer_id.to_s if customer_id
        url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
        Log.trace { "Query params: #{query_params}" }
        response = @client.request("GET", url)
        result = Polar::Models::MetricsResponse.from_json(response)
        Log.debug { "get completed successfully" }
        result
      end

      # Get Metrics Limits
      #
      # Get the interval limits for the metrics endpoint.
      #
      # Scopes: metrics:read
      #
      # **Endpoint:** `GET /v1/metrics/limits`
      #
      # **Returns:** Polar::Models::MetricsLimits
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def limits : Polar::Models::MetricsLimits
        Log.debug { "Calling limits" }
        url = "/v1/metrics/limits"
        response = @client.request("GET", url)
        result = Polar::Models::MetricsLimits.from_json(response)
        Log.debug { "limits completed successfully" }
        result
      end
    end
  end

  # Extend Client class with metrics API accessor
  class Client
    # Access the metrics API
    #
    # @return [Api::Metrics] The metrics API client
    def metrics : Api::Metrics
      Api::Metrics.new(self)
    end
  end
end
