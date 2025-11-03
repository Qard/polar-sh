# Meters
#
# API client for meters resource operations.
#
# This class provides methods for interacting with meters-related endpoints
# in the Polar.sh API. All methods return JSON response strings that can be
# parsed into appropriate model types.
#
# Auto-generated from OpenAPI spec
module Polar
  module Api
    # API client for meters operations
    class Meters
      Log = ::Log.for(self)

      # Creates a new Meters instance
      #
      # @param client [Client] The Polar API client instance
      def initialize(@client : Client)
        Log.debug { "Initialized Meters API client" }
      end

      # List Meters
      #
      # List meters.
      #
      # Scopes: meters:read meters:write
      #
      # **Endpoint:** `GET /v1/meters/`
      #
      # **Parameters:**
      # - `organization_id` (optional): Filter by organization ID.
      # - `query` (optional): Filter by name.
      # - `is_archived` (optional): Filter on archived meters.
      # - `page` (optional): Page number, defaults to 1.
      # - `limit` (optional): Size of a page, defaults to 10. Maximum is 100.
      # - `sorting` (optional): Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign - before the criteria name to sort by descending order.
      # - `metadata` (optional): Filter by metadata key-value pairs. It uses the deepObject style, e.g. ?metadata[key]=value.
      #
      # **Returns:** Polar::Models::ListResource(Polar::Models::Meter)
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def list(organization_id : String? = nil, query : String? = nil, is_archived : String? = nil, page : Int32? = nil, limit : Int32? = nil, sorting : String? = nil, metadata : String? = nil) : Polar::Models::ListResource(Polar::Models::Meter)
        Log.debug { "Calling list" }
        url = "/v1/meters/"
        query_params = {} of String => String
        query_params["organization_id"] = organization_id.to_s if organization_id
        query_params["query"] = query.to_s if query
        query_params["is_archived"] = is_archived.to_s if is_archived
        query_params["page"] = page.to_s if page
        query_params["limit"] = limit.to_s if limit
        query_params["sorting"] = sorting.to_s if sorting
        query_params["metadata"] = metadata.to_s if metadata
        url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
        Log.trace { "Query params: #{query_params}" }
        response = @client.request("GET", url)
        result = Polar::Models::ListResource(Polar::Models::Meter).from_json(response)
        Log.debug { "list completed successfully" }
        result
      end

      # Create Meter
      #
      # Create a meter.
      #
      # Scopes: meters:write
      #
      # **Endpoint:** `POST /v1/meters/`
      #
      # **Parameters:**
      # - `body` (required): Request body as Polar::Models::MeterCreate
      #
      # **Returns:** Polar::Models::Meter
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def create(body : Polar::Models::MeterCreate) : Polar::Models::Meter
        Log.debug { "Calling create" }
        url = "/v1/meters/"
        response = @client.request("POST", url, body: body.to_json)
        result = Polar::Models::Meter.from_json(response)
        Log.debug { "create completed successfully" }
        result
      end

      # Get Meter
      #
      # Get a meter by ID.
      #
      # Scopes: meters:read meters:write
      #
      # **Endpoint:** `GET /v1/meters/{id}`
      #
      # **Parameters:**
      # - `id` (required): The meter ID.
      #
      # **Returns:** Polar::Models::Meter
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def get(id : String) : Polar::Models::Meter
        Log.debug { "Calling get" }
        url = "/v1/meters/#{id}"
        response = @client.request("GET", url)
        result = Polar::Models::Meter.from_json(response)
        Log.debug { "get completed successfully" }
        result
      end

      # Update Meter
      #
      # Update a meter.
      #
      # Scopes: meters:write
      #
      # **Endpoint:** `PATCH /v1/meters/{id}`
      #
      # **Parameters:**
      # - `id` (required): The meter ID.
      # - `body` (required): Request body as Polar::Models::MeterUpdate
      #
      # **Returns:** Polar::Models::Meter
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def update(id : String, body : Polar::Models::MeterUpdate) : Polar::Models::Meter
        Log.debug { "Calling update" }
        url = "/v1/meters/#{id}"
        response = @client.request("PATCH", url, body: body.to_json)
        result = Polar::Models::Meter.from_json(response)
        Log.debug { "update completed successfully" }
        result
      end

      # Get Meter Quantities
      #
      # Get quantities of a meter over a time period.
      #
      # Scopes: meters:read meters:write
      #
      # **Endpoint:** `GET /v1/meters/{id}/quantities`
      #
      # **Parameters:**
      # - `id` (required): The meter ID.
      # - `start_timestamp` (required): Start timestamp.
      # - `end_timestamp` (required): End timestamp.
      # - `interval` (required): Interval between two timestamps.
      # - `customer_id` (optional): Filter by customer ID.
      # - `external_customer_id` (optional): Filter by external customer ID.
      # - `customer_aggregation_function` (optional): If set, will first compute the quantities per customer before aggregating them using the given function. If not set, the quantities will be aggregated across all events.
      # - `metadata` (optional): Filter by metadata key-value pairs. It uses the deepObject style, e.g. ?metadata[key]=value.
      #
      # **Returns:** Polar::Models::MeterQuantities
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def quantities(id : String, start_timestamp : String, end_timestamp : String, interval : String, customer_id : String? = nil, external_customer_id : String? = nil, customer_aggregation_function : String? = nil, metadata : String? = nil) : Polar::Models::MeterQuantities
        Log.debug { "Calling quantities" }
        url = "/v1/meters/#{id}/quantities"
        query_params = {} of String => String
        query_params["start_timestamp"] = start_timestamp.to_s if start_timestamp
        query_params["end_timestamp"] = end_timestamp.to_s if end_timestamp
        query_params["interval"] = interval.to_s if interval
        query_params["customer_id"] = customer_id.to_s if customer_id
        query_params["external_customer_id"] = external_customer_id.to_s if external_customer_id
        query_params["customer_aggregation_function"] = customer_aggregation_function.to_s if customer_aggregation_function
        query_params["metadata"] = metadata.to_s if metadata
        url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
        Log.trace { "Query params: #{query_params}" }
        response = @client.request("GET", url)
        result = Polar::Models::MeterQuantities.from_json(response)
        Log.debug { "quantities completed successfully" }
        result
      end
    end
  end

  # Extend Client class with meters API accessor
  class Client
    # Access the meters API
    #
    # @return [Api::Meters] The meters API client
    def meters : Api::Meters
      Api::Meters.new(self)
    end
  end
end
