# Checkouts
#
# API client for checkouts resource operations.
#
# This class provides methods for interacting with checkouts-related endpoints
# in the Polar.sh API. All methods return JSON response strings that can be
# parsed into appropriate model types.
#
# Auto-generated from OpenAPI spec
module Polar
  module Api
    # API client for checkouts operations
    class Checkouts
      Log = ::Log.for(self)

      # Creates a new Checkouts instance
      #
      # @param client [Client] The Polar API client instance
      def initialize(@client : Client)
        Log.debug { "Initialized Checkouts API client" }
      end

      # List Checkout Sessions
      #
      # List checkout sessions.
      #
      # Scopes: checkouts:read checkouts:write
      #
      # **Endpoint:** `GET /v1/checkouts/`
      #
      # **Parameters:**
      # - `organization_id` (optional): Filter by organization ID.
      # - `product_id` (optional): Filter by product ID.
      # - `customer_id` (optional): Filter by customer ID.
      # - `status` (optional): Filter by checkout session status.
      # - `query` (optional): Filter by customer email.
      # - `page` (optional): Page number, defaults to 1.
      # - `limit` (optional): Size of a page, defaults to 10. Maximum is 100.
      # - `sorting` (optional): Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign - before the criteria name to sort by descending order.
      #
      # **Returns:** Polar::Models::ListResource(Polar::Models::Checkout)
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def list(organization_id : String? = nil, product_id : String? = nil, customer_id : String? = nil, status : String? = nil, query : String? = nil, page : Int32? = nil, limit : Int32? = nil, sorting : String? = nil) : Polar::Models::ListResource(Polar::Models::Checkout)
        Log.debug { "Calling list" }
        url = "/v1/checkouts/"
        query_params = {} of String => String
        query_params["organization_id"] = organization_id.to_s if organization_id
        query_params["product_id"] = product_id.to_s if product_id
        query_params["customer_id"] = customer_id.to_s if customer_id
        query_params["status"] = status.to_s if status
        query_params["query"] = query.to_s if query
        query_params["page"] = page.to_s if page
        query_params["limit"] = limit.to_s if limit
        query_params["sorting"] = sorting.to_s if sorting
        url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
        Log.trace { "Query params: #{query_params}" }
        response = @client.request("GET", url)
        result = Polar::Models::ListResource(Polar::Models::Checkout).from_json(response)
        Log.debug { "list completed successfully" }
        result
      end

      # Create Checkout Session
      #
      # Create a checkout session.
      #
      # Scopes: checkouts:write
      #
      # **Endpoint:** `POST /v1/checkouts/`
      #
      # **Parameters:**
      # - `body` (required): Request body as Polar::Models::CheckoutCreate
      #
      # **Returns:** Polar::Models::Checkout
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def create(body : Polar::Models::CheckoutCreate) : Polar::Models::Checkout
        Log.debug { "Calling create" }
        url = "/v1/checkouts/"
        response = @client.request("POST", url, body: body.to_json)
        result = Polar::Models::Checkout.from_json(response)
        Log.debug { "create completed successfully" }
        result
      end

      # Get Checkout Session
      #
      # Get a checkout session by ID.
      #
      # Scopes: checkouts:read checkouts:write
      #
      # **Endpoint:** `GET /v1/checkouts/{id}`
      #
      # **Parameters:**
      # - `id` (required): The checkout session ID.
      #
      # **Returns:** Polar::Models::Checkout
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def get(id : String) : Polar::Models::Checkout
        Log.debug { "Calling get" }
        url = "/v1/checkouts/#{id}"
        response = @client.request("GET", url)
        result = Polar::Models::Checkout.from_json(response)
        Log.debug { "get completed successfully" }
        result
      end

      # Update Checkout Session
      #
      # Update a checkout session.
      #
      # Scopes: checkouts:write
      #
      # **Endpoint:** `PATCH /v1/checkouts/{id}`
      #
      # **Parameters:**
      # - `id` (required): The checkout session ID.
      # - `body` (required): Request body as Polar::Models::CheckoutUpdate
      #
      # **Returns:** Polar::Models::Checkout
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def update(id : String, body : Polar::Models::CheckoutUpdate) : Polar::Models::Checkout
        Log.debug { "Calling update" }
        url = "/v1/checkouts/#{id}"
        response = @client.request("PATCH", url, body: body.to_json)
        result = Polar::Models::Checkout.from_json(response)
        Log.debug { "update completed successfully" }
        result
      end

      # Get Checkout Session from Client
      #
      # Get a checkout session by client secret.
      #
      # **Endpoint:** `GET /v1/checkouts/client/{client_secret}`
      #
      # **Parameters:**
      # - `client_secret` (required): The checkout session client secret.
      #
      # **Returns:** Polar::Models::CheckoutPublic
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def client_get(client_secret : String) : Polar::Models::CheckoutPublic
        Log.debug { "Calling client_get" }
        url = "/v1/checkouts/client/#{client_secret}"
        response = @client.request("GET", url)
        result = Polar::Models::CheckoutPublic.from_json(response)
        Log.debug { "client_get completed successfully" }
        result
      end

      # Update Checkout Session from Client
      #
      # Update a checkout session by client secret.
      #
      # **Endpoint:** `PATCH /v1/checkouts/client/{client_secret}`
      #
      # **Parameters:**
      # - `client_secret` (required): The checkout session client secret.
      # - `body` (required): Request body as Polar::Models::CheckoutUpdatePublic
      #
      # **Returns:** Polar::Models::CheckoutPublic
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def client_update(client_secret : String, body : Polar::Models::CheckoutUpdatePublic) : Polar::Models::CheckoutPublic
        Log.debug { "Calling client_update" }
        url = "/v1/checkouts/client/#{client_secret}"
        response = @client.request("PATCH", url, body: body.to_json)
        result = Polar::Models::CheckoutPublic.from_json(response)
        Log.debug { "client_update completed successfully" }
        result
      end

      # Confirm Checkout Session from Client
      #
      # Confirm a checkout session by client secret.
      #
      # Orders and subscriptions will be processed.
      #
      # **Endpoint:** `POST /v1/checkouts/client/{client_secret}/confirm`
      #
      # **Parameters:**
      # - `client_secret` (required): The checkout session client secret.
      # - `body` (required): Request body as Polar::Models::CheckoutConfirmStripe
      #
      # **Returns:** Polar::Models::CheckoutPublicConfirmed
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def client_confirm(client_secret : String, body : Polar::Models::CheckoutConfirmStripe) : Polar::Models::CheckoutPublicConfirmed
        Log.debug { "Calling client_confirm" }
        url = "/v1/checkouts/client/#{client_secret}/confirm"
        response = @client.request("POST", url, body: body.to_json)
        result = Polar::Models::CheckoutPublicConfirmed.from_json(response)
        Log.debug { "client_confirm completed successfully" }
        result
      end
    end
  end

  # Extend Client class with checkouts API accessor
  class Client
    # Access the checkouts API
    #
    # @return [Api::Checkouts] The checkouts API client
    def checkouts : Api::Checkouts
      Api::Checkouts.new(self)
    end
  end
end
