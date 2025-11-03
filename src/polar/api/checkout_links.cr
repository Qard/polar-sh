# CheckoutLinks
#
# API client for checkout_links resource operations.
#
# This class provides methods for interacting with checkout_links-related endpoints
# in the Polar.sh API. All methods return JSON response strings that can be
# parsed into appropriate model types.
#
# Auto-generated from OpenAPI spec
module Polar
  module Api
    # API client for checkout_links operations
    class CheckoutLinks
      Log = ::Log.for(self)

      # Creates a new CheckoutLinks instance
      #
      # @param client [Client] The Polar API client instance
      def initialize(@client : Client)
        Log.debug { "Initialized CheckoutLinks API client" }
      end

      # List Checkout Links
      #
      # List checkout links.
      #
      # Scopes: checkout_links:read checkout_links:write
      #
      # **Endpoint:** `GET /v1/checkout-links/`
      #
      # **Parameters:**
      # - `organization_id` (optional): Filter by organization ID.
      # - `product_id` (optional): Filter by product ID.
      # - `page` (optional): Page number, defaults to 1.
      # - `limit` (optional): Size of a page, defaults to 10. Maximum is 100.
      # - `sorting` (optional): Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign - before the criteria name to sort by descending order.
      #
      # **Returns:** Polar::Models::ListResource(Polar::Models::CheckoutLink)
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def list(organization_id : String? = nil, product_id : String? = nil, page : Int32? = nil, limit : Int32? = nil, sorting : String? = nil) : Polar::Models::ListResource(Polar::Models::CheckoutLink)
        Log.debug { "Calling list" }
        url = "/v1/checkout-links/"
        query_params = {} of String => String
        query_params["organization_id"] = organization_id.to_s if organization_id
        query_params["product_id"] = product_id.to_s if product_id
        query_params["page"] = page.to_s if page
        query_params["limit"] = limit.to_s if limit
        query_params["sorting"] = sorting.to_s if sorting
        url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
        Log.trace { "Query params: #{query_params}" }
        response = @client.request("GET", url)
        result = Polar::Models::ListResource(Polar::Models::CheckoutLink).from_json(response)
        Log.debug { "list completed successfully" }
        result
      end

      # Create Checkout Link
      #
      # Create a checkout link.
      #
      # Scopes: checkout_links:write
      #
      # **Endpoint:** `POST /v1/checkout-links/`
      #
      # **Parameters:**
      # - `body` (required): Request body as Polar::Models::CheckoutLinkCreate
      #
      # **Returns:** Polar::Models::CheckoutLink
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def create(body : Polar::Models::CheckoutLinkCreate) : Polar::Models::CheckoutLink
        Log.debug { "Calling create" }
        url = "/v1/checkout-links/"
        response = @client.request("POST", url, body: body.to_json)
        result = Polar::Models::CheckoutLink.from_json(response)
        Log.debug { "create completed successfully" }
        result
      end

      # Get Checkout Link
      #
      # Get a checkout link by ID.
      #
      # Scopes: checkout_links:read checkout_links:write
      #
      # **Endpoint:** `GET /v1/checkout-links/{id}`
      #
      # **Parameters:**
      # - `id` (required): The checkout link ID.
      #
      # **Returns:** Polar::Models::CheckoutLink
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def get(id : String) : Polar::Models::CheckoutLink
        Log.debug { "Calling get" }
        url = "/v1/checkout-links/#{id}"
        response = @client.request("GET", url)
        result = Polar::Models::CheckoutLink.from_json(response)
        Log.debug { "get completed successfully" }
        result
      end

      # Update Checkout Link
      #
      # Update a checkout link.
      #
      # Scopes: checkout_links:write
      #
      # **Endpoint:** `PATCH /v1/checkout-links/{id}`
      #
      # **Parameters:**
      # - `id` (required): The checkout link ID.
      # - `body` (required): Request body as Polar::Models::CheckoutLinkUpdate
      #
      # **Returns:** Polar::Models::CheckoutLink
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def update(id : String, body : Polar::Models::CheckoutLinkUpdate) : Polar::Models::CheckoutLink
        Log.debug { "Calling update" }
        url = "/v1/checkout-links/#{id}"
        response = @client.request("PATCH", url, body: body.to_json)
        result = Polar::Models::CheckoutLink.from_json(response)
        Log.debug { "update completed successfully" }
        result
      end

      # Delete Checkout Link
      #
      # Delete a checkout link.
      #
      # Scopes: checkout_links:write
      #
      # **Endpoint:** `DELETE /v1/checkout-links/{id}`
      #
      # **Parameters:**
      # - `id` (required): The checkout link ID.
      #
      # **Returns:** JSON response string
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def delete(id : String)
        Log.debug { "Calling delete" }
        url = "/v1/checkout-links/#{id}"
        response = @client.request("DELETE", url)
        Log.debug { "delete completed successfully" }
        response
      end
    end
  end

  # Extend Client class with checkout_links API accessor
  class Client
    # Access the checkout_links API
    #
    # @return [Api::CheckoutLinks] The checkout_links API client
    def checkout_links : Api::CheckoutLinks
      Api::CheckoutLinks.new(self)
    end
  end
end
