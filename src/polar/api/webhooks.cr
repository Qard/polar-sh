# Webhooks
#
# API client for webhooks resource operations.
#
# This class provides methods for interacting with webhooks-related endpoints
# in the Polar.sh API. All methods return JSON response strings that can be
# parsed into appropriate model types.
#
# Auto-generated from OpenAPI spec
module Polar
  module Api
    # API client for webhooks operations
    class Webhooks
      Log = ::Log.for(self)

      # Creates a new Webhooks instance
      #
      # @param client [Client] The Polar API client instance
      def initialize(@client : Client)
        Log.debug { "Initialized Webhooks API client" }
      end

      # List Webhook Endpoints
      #
      # List webhook endpoints.
      #
      # Scopes: webhooks:read webhooks:write
      #
      # **Endpoint:** `GET /v1/webhooks/endpoints`
      #
      # **Parameters:**
      # - `organization_id` (optional): Filter by organization ID.
      # - `page` (optional): Page number, defaults to 1.
      # - `limit` (optional): Size of a page, defaults to 10. Maximum is 100.
      #
      # **Returns:** Polar::Models::ListResource(Polar::Models::WebhookEndpoint)
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def list_webhook_endpoints(organization_id : String? = nil, page : Int32? = nil, limit : Int32? = nil) : Polar::Models::ListResource(Polar::Models::WebhookEndpoint)
        Log.debug { "Calling list_webhook_endpoints" }
        url = "/v1/webhooks/endpoints"
        query_params = {} of String => String
        query_params["organization_id"] = organization_id.to_s if organization_id
        query_params["page"] = page.to_s if page
        query_params["limit"] = limit.to_s if limit
        url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
        Log.trace { "Query params: #{query_params}" }
        response = @client.request("GET", url)
        result = Polar::Models::ListResource(Polar::Models::WebhookEndpoint).from_json(response)
        Log.debug { "list_webhook_endpoints completed successfully" }
        result
      end

      # Create Webhook Endpoint
      #
      # Create a webhook endpoint.
      #
      # Scopes: webhooks:write
      #
      # **Endpoint:** `POST /v1/webhooks/endpoints`
      #
      # **Parameters:**
      # - `body` (required): Request body as Polar::Models::WebhookEndpointCreate
      #
      # **Returns:** Polar::Models::WebhookEndpoint
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def create_webhook_endpoint(body : Polar::Models::WebhookEndpointCreate) : Polar::Models::WebhookEndpoint
        Log.debug { "Calling create_webhook_endpoint" }
        url = "/v1/webhooks/endpoints"
        response = @client.request("POST", url, body: body.to_json)
        result = Polar::Models::WebhookEndpoint.from_json(response)
        Log.debug { "create_webhook_endpoint completed successfully" }
        result
      end

      # Get Webhook Endpoint
      #
      # Get a webhook endpoint by ID.
      #
      # Scopes: webhooks:read webhooks:write
      #
      # **Endpoint:** `GET /v1/webhooks/endpoints/{id}`
      #
      # **Parameters:**
      # - `id` (required): The webhook endpoint ID.
      #
      # **Returns:** Polar::Models::WebhookEndpoint
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def get_webhook_endpoint(id : String) : Polar::Models::WebhookEndpoint
        Log.debug { "Calling get_webhook_endpoint" }
        url = "/v1/webhooks/endpoints/#{id}"
        response = @client.request("GET", url)
        result = Polar::Models::WebhookEndpoint.from_json(response)
        Log.debug { "get_webhook_endpoint completed successfully" }
        result
      end

      # Update Webhook Endpoint
      #
      # Update a webhook endpoint.
      #
      # Scopes: webhooks:write
      #
      # **Endpoint:** `PATCH /v1/webhooks/endpoints/{id}`
      #
      # **Parameters:**
      # - `id` (required): The webhook endpoint ID.
      # - `body` (required): Request body as Polar::Models::WebhookEndpointUpdate
      #
      # **Returns:** Polar::Models::WebhookEndpoint
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def update_webhook_endpoint(id : String, body : Polar::Models::WebhookEndpointUpdate) : Polar::Models::WebhookEndpoint
        Log.debug { "Calling update_webhook_endpoint" }
        url = "/v1/webhooks/endpoints/#{id}"
        response = @client.request("PATCH", url, body: body.to_json)
        result = Polar::Models::WebhookEndpoint.from_json(response)
        Log.debug { "update_webhook_endpoint completed successfully" }
        result
      end

      # Delete Webhook Endpoint
      #
      # Delete a webhook endpoint.
      #
      # Scopes: webhooks:write
      #
      # **Endpoint:** `DELETE /v1/webhooks/endpoints/{id}`
      #
      # **Parameters:**
      # - `id` (required): The webhook endpoint ID.
      #
      # **Returns:** JSON response string
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def delete_webhook_endpoint(id : String)
        Log.debug { "Calling delete_webhook_endpoint" }
        url = "/v1/webhooks/endpoints/#{id}"
        response = @client.request("DELETE", url)
        Log.debug { "delete_webhook_endpoint completed successfully" }
        response
      end

      # Reset Webhook Endpoint Secret
      #
      # Regenerate a webhook endpoint secret.
      #
      # Scopes: webhooks:write
      #
      # **Endpoint:** `PATCH /v1/webhooks/endpoints/{id}/secret`
      #
      # **Parameters:**
      # - `id` (required): The webhook endpoint ID.
      #
      # **Returns:** Polar::Models::WebhookEndpoint
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def reset_webhook_endpoint_secret(id : String) : Polar::Models::WebhookEndpoint
        Log.debug { "Calling reset_webhook_endpoint_secret" }
        url = "/v1/webhooks/endpoints/#{id}/secret"
        response = @client.request("PATCH", url)
        result = Polar::Models::WebhookEndpoint.from_json(response)
        Log.debug { "reset_webhook_endpoint_secret completed successfully" }
        result
      end

      # List Webhook Deliveries
      #
      # List webhook deliveries.
      #
      # Deliveries are all the attempts to deliver a webhook event to an endpoint.
      #
      # Scopes: webhooks:read webhooks:write
      #
      # **Endpoint:** `GET /v1/webhooks/deliveries`
      #
      # **Parameters:**
      # - `endpoint_id` (optional): Filter by webhook endpoint ID.
      # - `start_timestamp` (optional): Filter deliveries after this timestamp.
      # - `end_timestamp` (optional): Filter deliveries before this timestamp.
      # - `page` (optional): Page number, defaults to 1.
      # - `limit` (optional): Size of a page, defaults to 10. Maximum is 100.
      #
      # **Returns:** Polar::Models::ListResource(Polar::Models::WebhookDelivery)
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def list_webhook_deliveries(endpoint_id : String? = nil, start_timestamp : String? = nil, end_timestamp : String? = nil, page : Int32? = nil, limit : Int32? = nil) : Polar::Models::ListResource(Polar::Models::WebhookDelivery)
        Log.debug { "Calling list_webhook_deliveries" }
        url = "/v1/webhooks/deliveries"
        query_params = {} of String => String
        query_params["endpoint_id"] = endpoint_id.to_s if endpoint_id
        query_params["start_timestamp"] = start_timestamp.to_s if start_timestamp
        query_params["end_timestamp"] = end_timestamp.to_s if end_timestamp
        query_params["page"] = page.to_s if page
        query_params["limit"] = limit.to_s if limit
        url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
        Log.trace { "Query params: #{query_params}" }
        response = @client.request("GET", url)
        result = Polar::Models::ListResource(Polar::Models::WebhookDelivery).from_json(response)
        Log.debug { "list_webhook_deliveries completed successfully" }
        result
      end

      # Redeliver Webhook Event
      #
      # Schedule the re-delivery of a webhook event.
      #
      # Scopes: webhooks:write
      #
      # **Endpoint:** `POST /v1/webhooks/events/{id}/redeliver`
      #
      # **Parameters:**
      # - `id` (required): The webhook event ID.
      #
      # **Returns:** JSON response string
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def redeliver_webhook_event(id : String)
        Log.debug { "Calling redeliver_webhook_event" }
        url = "/v1/webhooks/events/#{id}/redeliver"
        response = @client.request("POST", url)
        Log.debug { "redeliver_webhook_event completed successfully" }
        response
      end
    end
  end

  # Extend Client class with webhooks API accessor
  class Client
    # Access the webhooks API
    #
    # @return [Api::Webhooks] The webhooks API client
    def webhooks : Api::Webhooks
      Api::Webhooks.new(self)
    end
  end
end
