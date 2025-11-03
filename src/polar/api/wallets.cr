# Wallets
#
# API client for wallets resource operations.
#
# This class provides methods for interacting with wallets-related endpoints
# in the Polar.sh API. All methods return JSON response strings that can be
# parsed into appropriate model types.
#
# Auto-generated from OpenAPI spec
module Polar
  module Api
    # API client for wallets operations
    class Wallets
      Log = ::Log.for(self)

      # Creates a new Wallets instance
      #
      # @param client [Client] The Polar API client instance
      def initialize(@client : Client)
        Log.debug { "Initialized Wallets API client" }
      end

      # List Wallets
      #
      # List wallets.
      #
      # Scopes: wallets:read
      #
      # **Endpoint:** `GET /v1/wallets/`
      #
      # **Parameters:**
      # - `organization_id` (optional): Filter by organization ID.
      # - `customer_id` (optional): Filter by customer ID.
      # - `page` (optional): Page number, defaults to 1.
      # - `limit` (optional): Size of a page, defaults to 10. Maximum is 100.
      # - `sorting` (optional): Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign - before the criteria name to sort by descending order.
      #
      # **Returns:** Polar::Models::ListResource(Polar::Models::Wallet)
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def list(organization_id : String? = nil, customer_id : String? = nil, page : Int32? = nil, limit : Int32? = nil, sorting : String? = nil) : Polar::Models::ListResource(Polar::Models::Wallet)
        Log.debug { "Calling list" }
        url = "/v1/wallets/"
        query_params = {} of String => String
        query_params["organization_id"] = organization_id.to_s if organization_id
        query_params["customer_id"] = customer_id.to_s if customer_id
        query_params["page"] = page.to_s if page
        query_params["limit"] = limit.to_s if limit
        query_params["sorting"] = sorting.to_s if sorting
        url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
        Log.trace { "Query params: #{query_params}" }
        response = @client.request("GET", url)
        result = Polar::Models::ListResource(Polar::Models::Wallet).from_json(response)
        Log.debug { "list completed successfully" }
        result
      end

      # Get Wallet
      #
      # Get a wallet by ID.
      #
      # Scopes: wallets:read
      #
      # **Endpoint:** `GET /v1/wallets/{id}`
      #
      # **Parameters:**
      # - `id` (required): The wallet ID.
      #
      # **Returns:** Polar::Models::Wallet
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def get(id : String) : Polar::Models::Wallet
        Log.debug { "Calling get" }
        url = "/v1/wallets/#{id}"
        response = @client.request("GET", url)
        result = Polar::Models::Wallet.from_json(response)
        Log.debug { "get completed successfully" }
        result
      end

      # Top-Up Wallet
      #
      # Top-up a wallet by adding funds to its balance.
      #
      # The customer should have a valid payment method on file.
      #
      # Scopes: wallets:write
      #
      # **Endpoint:** `POST /v1/wallets/{id}/top-up`
      #
      # **Parameters:**
      # - `id` (required): The wallet ID.
      # - `body` (required): Request body as Polar::Models::WalletTopUpCreate
      #
      # **Returns:** Polar::Models::Wallet
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def top_up(id : String, body : Polar::Models::WalletTopUpCreate) : Polar::Models::Wallet
        Log.debug { "Calling top_up" }
        url = "/v1/wallets/#{id}/top-up"
        response = @client.request("POST", url, body: body.to_json)
        result = Polar::Models::Wallet.from_json(response)
        Log.debug { "top_up completed successfully" }
        result
      end
    end
  end

  # Extend Client class with wallets API accessor
  class Client
    # Access the wallets API
    #
    # @return [Api::Wallets] The wallets API client
    def wallets : Api::Wallets
      Api::Wallets.new(self)
    end
  end
end
