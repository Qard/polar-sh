# Subscriptions
#
# API client for subscriptions resource operations.
#
# This class provides methods for interacting with subscriptions-related endpoints
# in the Polar.sh API. All methods return JSON response strings that can be
# parsed into appropriate model types.
#
# Auto-generated from OpenAPI spec
module Polar
  module Api
    # API client for subscriptions operations
    class Subscriptions
      Log = ::Log.for(self)

      # Creates a new Subscriptions instance
      #
      # @param client [Client] The Polar API client instance
      def initialize(@client : Client)
        Log.debug { "Initialized Subscriptions API client" }
      end

      # List Subscriptions
      #
      # List subscriptions.
      #
      # Scopes: subscriptions:read subscriptions:write
      #
      # **Endpoint:** `GET /v1/subscriptions/`
      #
      # **Parameters:**
      # - `organization_id` (optional): Filter by organization ID.
      # - `product_id` (optional): Filter by product ID.
      # - `customer_id` (optional): Filter by customer ID.
      # - `external_customer_id` (optional): Filter by customer external ID.
      # - `discount_id` (optional): Filter by discount ID.
      # - `active` (optional): Filter by active or inactive subscription.
      # - `page` (optional): Page number, defaults to 1.
      # - `limit` (optional): Size of a page, defaults to 10. Maximum is 100.
      # - `sorting` (optional): Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign - before the criteria name to sort by descending order.
      # - `metadata` (optional): Filter by metadata key-value pairs. It uses the deepObject style, e.g. ?metadata[key]=value.
      #
      # **Returns:** Polar::Models::ListResource(Polar::Models::Subscription)
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def list(organization_id : String? = nil, product_id : String? = nil, customer_id : String? = nil, external_customer_id : String? = nil, discount_id : String? = nil, active : String? = nil, page : Int32? = nil, limit : Int32? = nil, sorting : String? = nil, metadata : String? = nil) : Polar::Models::ListResource(Polar::Models::Subscription)
        Log.debug { "Calling list" }
        url = "/v1/subscriptions/"
        query_params = {} of String => String
        query_params["organization_id"] = organization_id.to_s if organization_id
        query_params["product_id"] = product_id.to_s if product_id
        query_params["customer_id"] = customer_id.to_s if customer_id
        query_params["external_customer_id"] = external_customer_id.to_s if external_customer_id
        query_params["discount_id"] = discount_id.to_s if discount_id
        query_params["active"] = active.to_s if active
        query_params["page"] = page.to_s if page
        query_params["limit"] = limit.to_s if limit
        query_params["sorting"] = sorting.to_s if sorting
        query_params["metadata"] = metadata.to_s if metadata
        url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
        Log.trace { "Query params: #{query_params}" }
        response = @client.request("GET", url)
        result = Polar::Models::ListResource(Polar::Models::Subscription).from_json(response)
        Log.debug { "list completed successfully" }
        result
      end

      # Create Subscription
      #
      # Create a subscription programmatically.
      #
      # This endpoint only allows to create subscription on free products.
      # For paid products, use the checkout flow.
      #
      # No initial order will be created and no confirmation email will be sent.
      #
      # Scopes: subscriptions:write
      #
      # **Endpoint:** `POST /v1/subscriptions/`
      #
      # **Parameters:**
      # - `body` (required): Request body as Polar::Models::SubscriptionCreateCustomer
      #
      # **Returns:** Polar::Models::Subscription
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def create(body : Polar::Models::SubscriptionCreateCustomer) : Polar::Models::Subscription
        Log.debug { "Calling create" }
        url = "/v1/subscriptions/"
        response = @client.request("POST", url, body: body.to_json)
        result = Polar::Models::Subscription.from_json(response)
        Log.debug { "create completed successfully" }
        result
      end

      # Export Subscriptions
      #
      # Export subscriptions as a CSV file.
      #
      # Scopes: subscriptions:read subscriptions:write
      #
      # **Endpoint:** `GET /v1/subscriptions/export`
      #
      # **Parameters:**
      # - `organization_id` (optional): Filter by organization ID.
      #
      # **Returns:** JSON response string
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def export(organization_id : String? = nil)
        Log.debug { "Calling export" }
        url = "/v1/subscriptions/export"
        query_params = {} of String => String
        query_params["organization_id"] = organization_id.to_s if organization_id
        url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
        Log.trace { "Query params: #{query_params}" }
        response = @client.request("GET", url)
        Log.debug { "export completed successfully" }
        response
      end

      # Get Subscription
      #
      # Get a subscription by ID.
      #
      # Scopes: subscriptions:read subscriptions:write
      #
      # **Endpoint:** `GET /v1/subscriptions/{id}`
      #
      # **Parameters:**
      # - `id` (required): The subscription ID.
      #
      # **Returns:** Polar::Models::Subscription
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def get(id : String) : Polar::Models::Subscription
        Log.debug { "Calling get" }
        url = "/v1/subscriptions/#{id}"
        response = @client.request("GET", url)
        result = Polar::Models::Subscription.from_json(response)
        Log.debug { "get completed successfully" }
        result
      end

      # Update Subscription
      #
      # Update a subscription.
      #
      # Scopes: subscriptions:write
      #
      # **Endpoint:** `PATCH /v1/subscriptions/{id}`
      #
      # **Parameters:**
      # - `id` (required): The subscription ID.
      # - `body` (required): Request body as Polar::Models::SubscriptionUpdate
      #
      # **Returns:** Polar::Models::Subscription
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def update(id : String, body : Polar::Models::SubscriptionUpdate) : Polar::Models::Subscription
        Log.debug { "Calling update" }
        url = "/v1/subscriptions/#{id}"
        response = @client.request("PATCH", url, body: body.to_json)
        result = Polar::Models::Subscription.from_json(response)
        Log.debug { "update completed successfully" }
        result
      end

      # Revoke Subscription
      #
      # Revoke a subscription, i.e cancel immediately.
      #
      # Scopes: subscriptions:write
      #
      # **Endpoint:** `DELETE /v1/subscriptions/{id}`
      #
      # **Parameters:**
      # - `id` (required): The subscription ID.
      #
      # **Returns:** Polar::Models::Subscription
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def revoke(id : String) : Polar::Models::Subscription
        Log.debug { "Calling revoke" }
        url = "/v1/subscriptions/#{id}"
        response = @client.request("DELETE", url)
        result = Polar::Models::Subscription.from_json(response)
        Log.debug { "revoke completed successfully" }
        result
      end
    end
  end

  # Extend Client class with subscriptions API accessor
  class Client
    # Access the subscriptions API
    #
    # @return [Api::Subscriptions] The subscriptions API client
    def subscriptions : Api::Subscriptions
      Api::Subscriptions.new(self)
    end
  end
end
