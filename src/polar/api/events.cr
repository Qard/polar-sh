# Events
#
# API client for events resource operations.
#
# This class provides methods for interacting with events-related endpoints
# in the Polar.sh API. All methods return JSON response strings that can be
# parsed into appropriate model types.
#
# Auto-generated from OpenAPI spec
module Polar
  module Api
    # API client for events operations
    class Events
      Log = ::Log.for(self)

      # Creates a new Events instance
      #
      # @param client [Client] The Polar API client instance
      def initialize(@client : Client)
        Log.debug { "Initialized Events API client" }
      end

      # List Events
      #
      # List events.
      #
      # Scopes: events:read events:write
      #
      # **Endpoint:** `GET /v1/events/`
      #
      # **Parameters:**
      # - `filter` (optional): Filter events following filter clauses. JSON string following the same schema a meter filter clause.
      # - `start_timestamp` (optional): Filter events after this timestamp.
      # - `end_timestamp` (optional): Filter events before this timestamp.
      # - `organization_id` (optional): Filter by organization ID.
      # - `customer_id` (optional): Filter by customer ID.
      # - `external_customer_id` (optional): Filter by external customer ID.
      # - `meter_id` (optional): Filter by a meter filter clause.
      # - `name` (optional): Filter by event name.
      # - `source` (optional): Filter by event source.
      # - `query` (optional): Query to filter events.
      # - `page` (optional): Page number, defaults to 1.
      # - `limit` (optional): Size of a page, defaults to 10. Maximum is 100.
      # - `sorting` (optional): Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign - before the criteria name to sort by descending order.
      # - `metadata` (optional): Filter by metadata key-value pairs. It uses the deepObject style, e.g. ?metadata[key]=value.
      #
      # **Returns:** Polar::Models::ListResource(Polar::Models::Event)
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def list(filter : String? = nil, start_timestamp : String? = nil, end_timestamp : String? = nil, organization_id : String? = nil, customer_id : String? = nil, external_customer_id : String? = nil, meter_id : String? = nil, name : String? = nil, source : String? = nil, query : String? = nil, page : Int32? = nil, limit : Int32? = nil, sorting : String? = nil, metadata : String? = nil) : Polar::Models::ListResource(Polar::Models::Event)
        Log.debug { "Calling list" }
        url = "/v1/events/"
        query_params = {} of String => String
        query_params["filter"] = filter.to_s if filter
        query_params["start_timestamp"] = start_timestamp.to_s if start_timestamp
        query_params["end_timestamp"] = end_timestamp.to_s if end_timestamp
        query_params["organization_id"] = organization_id.to_s if organization_id
        query_params["customer_id"] = customer_id.to_s if customer_id
        query_params["external_customer_id"] = external_customer_id.to_s if external_customer_id
        query_params["meter_id"] = meter_id.to_s if meter_id
        query_params["name"] = name.to_s if name
        query_params["source"] = source.to_s if source
        query_params["query"] = query.to_s if query
        query_params["page"] = page.to_s if page
        query_params["limit"] = limit.to_s if limit
        query_params["sorting"] = sorting.to_s if sorting
        query_params["metadata"] = metadata.to_s if metadata
        url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
        Log.trace { "Query params: #{query_params}" }
        response = @client.request("GET", url)
        result = Polar::Models::ListResource(Polar::Models::Event).from_json(response)
        Log.debug { "list completed successfully" }
        result
      end

      # List Event Names
      #
      # List event names.
      #
      # Scopes: events:read events:write
      #
      # **Endpoint:** `GET /v1/events/names`
      #
      # **Parameters:**
      # - `organization_id` (optional): Filter by organization ID.
      # - `customer_id` (optional): Filter by customer ID.
      # - `external_customer_id` (optional): Filter by external customer ID.
      # - `source` (optional): Filter by event source.
      # - `query` (optional): Query to filter event names.
      # - `page` (optional): Page number, defaults to 1.
      # - `limit` (optional): Size of a page, defaults to 10. Maximum is 100.
      # - `sorting` (optional): Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign - before the criteria name to sort by descending order.
      #
      # **Returns:** Polar::Models::ListResource(Polar::Models::EventName)
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def list_names(organization_id : String? = nil, customer_id : String? = nil, external_customer_id : String? = nil, source : String? = nil, query : String? = nil, page : Int32? = nil, limit : Int32? = nil, sorting : String? = nil) : Polar::Models::ListResource(Polar::Models::EventName)
        Log.debug { "Calling list_names" }
        url = "/v1/events/names"
        query_params = {} of String => String
        query_params["organization_id"] = organization_id.to_s if organization_id
        query_params["customer_id"] = customer_id.to_s if customer_id
        query_params["external_customer_id"] = external_customer_id.to_s if external_customer_id
        query_params["source"] = source.to_s if source
        query_params["query"] = query.to_s if query
        query_params["page"] = page.to_s if page
        query_params["limit"] = limit.to_s if limit
        query_params["sorting"] = sorting.to_s if sorting
        url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
        Log.trace { "Query params: #{query_params}" }
        response = @client.request("GET", url)
        result = Polar::Models::ListResource(Polar::Models::EventName).from_json(response)
        Log.debug { "list_names completed successfully" }
        result
      end

      # Get Event
      #
      # Get an event by ID.
      #
      # Scopes: events:read events:write
      #
      # **Endpoint:** `GET /v1/events/{id}`
      #
      # **Parameters:**
      # - `id` (required): The event ID.
      #
      # **Returns:** Polar::Models::Event
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def get(id : String) : Polar::Models::Event
        Log.debug { "Calling get" }
        url = "/v1/events/#{id}"
        response = @client.request("GET", url)
        result = Polar::Models::Event.from_json(response)
        Log.debug { "get completed successfully" }
        result
      end

      # Ingest Events
      #
      # Ingest batch of events.
      #
      # Scopes: events:write
      #
      # **Endpoint:** `POST /v1/events/ingest`
      #
      # **Parameters:**
      # - `body` (required): Request body as Polar::Models::EventsIngest
      #
      # **Returns:** Polar::Models::EventsIngestResponse
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def ingest(body : Polar::Models::EventsIngest) : Polar::Models::EventsIngestResponse
        Log.debug { "Calling ingest" }
        url = "/v1/events/ingest"
        response = @client.request("POST", url, body: body.to_json)
        result = Polar::Models::EventsIngestResponse.from_json(response)
        Log.debug { "ingest completed successfully" }
        result
      end
    end
  end

  # Extend Client class with events API accessor
  class Client
    # Access the events API
    #
    # @return [Api::Events] The events API client
    def events : Api::Events
      Api::Events.new(self)
    end
  end
end
