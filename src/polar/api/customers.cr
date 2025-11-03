# Customers
#
# API client for customers resource operations.
#
# This class provides methods for interacting with customers-related endpoints
# in the Polar.sh API. All methods return JSON response strings that can be
# parsed into appropriate model types.
#
# Auto-generated from OpenAPI spec
module Polar
  module Api
    # API client for customers operations
    class Customers
      Log = ::Log.for(self)

      # Creates a new Customers instance
      #
      # @param client [Client] The Polar API client instance
      def initialize(@client : Client)
        Log.debug { "Initialized Customers API client" }
      end

      # List Customers
      #
      # List customers.
      #
      # Scopes: customers:read customers:write
      #
      # **Endpoint:** `GET /v1/customers/`
      #
      # **Parameters:**
      # - `organization_id` (optional): Filter by organization ID.
      # - `email` (optional): Filter by exact email.
      # - `query` (optional): Filter by name, email, or external ID.
      # - `page` (optional): Page number, defaults to 1.
      # - `limit` (optional): Size of a page, defaults to 10. Maximum is 100.
      # - `sorting` (optional): Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign - before the criteria name to sort by descending order.
      # - `metadata` (optional): Filter by metadata key-value pairs. It uses the deepObject style, e.g. ?metadata[key]=value.
      #
      # **Returns:** Polar::Models::ListResource(Polar::Models::Customer)
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def list(organization_id : String? = nil, email : String? = nil, query : String? = nil, page : Int32? = nil, limit : Int32? = nil, sorting : String? = nil, metadata : String? = nil) : Polar::Models::ListResource(Polar::Models::Customer)
        Log.debug { "Calling list" }
        url = "/v1/customers/"
        query_params = {} of String => String
        query_params["organization_id"] = organization_id.to_s if organization_id
        query_params["email"] = email.to_s if email
        query_params["query"] = query.to_s if query
        query_params["page"] = page.to_s if page
        query_params["limit"] = limit.to_s if limit
        query_params["sorting"] = sorting.to_s if sorting
        query_params["metadata"] = metadata.to_s if metadata
        url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
        Log.trace { "Query params: #{query_params}" }
        response = @client.request("GET", url)
        result = Polar::Models::ListResource(Polar::Models::Customer).from_json(response)
        Log.debug { "list completed successfully" }
        result
      end

      # Create Customer
      #
      # Create a customer.
      #
      # Scopes: customers:write
      #
      # **Endpoint:** `POST /v1/customers/`
      #
      # **Parameters:**
      # - `body` (required): Request body as Polar::Models::CustomerCreate
      #
      # **Returns:** Polar::Models::Customer
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def create(body : Polar::Models::CustomerCreate) : Polar::Models::Customer
        Log.debug { "Calling create" }
        url = "/v1/customers/"
        response = @client.request("POST", url, body: body.to_json)
        result = Polar::Models::Customer.from_json(response)
        Log.debug { "create completed successfully" }
        result
      end

      # Export Customers
      #
      # Export customers as a CSV file.
      #
      # Scopes: customers:read customers:write
      #
      # **Endpoint:** `GET /v1/customers/export`
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
        url = "/v1/customers/export"
        query_params = {} of String => String
        query_params["organization_id"] = organization_id.to_s if organization_id
        url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
        Log.trace { "Query params: #{query_params}" }
        response = @client.request("GET", url)
        Log.debug { "export completed successfully" }
        response
      end

      # Get Customer
      #
      # Get a customer by ID.
      #
      # Scopes: customers:read customers:write
      #
      # **Endpoint:** `GET /v1/customers/{id}`
      #
      # **Parameters:**
      # - `id` (required): The customer ID.
      #
      # **Returns:** Polar::Models::Customer
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def get(id : String) : Polar::Models::Customer
        Log.debug { "Calling get" }
        url = "/v1/customers/#{id}"
        response = @client.request("GET", url)
        result = Polar::Models::Customer.from_json(response)
        Log.debug { "get completed successfully" }
        result
      end

      # Update Customer
      #
      # Update a customer.
      #
      # Scopes: customers:write
      #
      # **Endpoint:** `PATCH /v1/customers/{id}`
      #
      # **Parameters:**
      # - `id` (required): The customer ID.
      # - `body` (required): Request body as Polar::Models::CustomerUpdate
      #
      # **Returns:** Polar::Models::Customer
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def update(id : String, body : Polar::Models::CustomerUpdate) : Polar::Models::Customer
        Log.debug { "Calling update" }
        url = "/v1/customers/#{id}"
        response = @client.request("PATCH", url, body: body.to_json)
        result = Polar::Models::Customer.from_json(response)
        Log.debug { "update completed successfully" }
        result
      end

      # Delete Customer
      #
      # Delete a customer.
      #
      # This action cannot be undone and will immediately:
      # - Cancel any active subscriptions for the customer
      # - Revoke all their benefits
      # - Clear any external_id
      #
      # Use it only in the context of deleting a user within your
      # own service. Otherwise, use more granular API endpoints to cancel
      # a specific subscription or revoke certain benefits.
      #
      # Note: The customers information will nonetheless be retained for historic
      # orders and subscriptions.
      #
      # Scopes: customers:write
      #
      # **Endpoint:** `DELETE /v1/customers/{id}`
      #
      # **Parameters:**
      # - `id` (required): The customer ID.
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
        url = "/v1/customers/#{id}"
        response = @client.request("DELETE", url)
        Log.debug { "delete completed successfully" }
        response
      end

      # Get Customer by External ID
      #
      # Get a customer by external ID.
      #
      # Scopes: customers:read customers:write
      #
      # **Endpoint:** `GET /v1/customers/external/{external_id}`
      #
      # **Parameters:**
      # - `external_id` (required): The customer external ID.
      #
      # **Returns:** Polar::Models::Customer
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def get_external(external_id : String) : Polar::Models::Customer
        Log.debug { "Calling get_external" }
        url = "/v1/customers/external/#{external_id}"
        response = @client.request("GET", url)
        result = Polar::Models::Customer.from_json(response)
        Log.debug { "get_external completed successfully" }
        result
      end

      # Update Customer by External ID
      #
      # Update a customer by external ID.
      #
      # Scopes: customers:write
      #
      # **Endpoint:** `PATCH /v1/customers/external/{external_id}`
      #
      # **Parameters:**
      # - `external_id` (required): The customer external ID.
      # - `body` (required): Request body as Polar::Models::CustomerUpdateExternalID
      #
      # **Returns:** Polar::Models::Customer
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def update_external(external_id : String, body : Polar::Models::CustomerUpdateExternalID) : Polar::Models::Customer
        Log.debug { "Calling update_external" }
        url = "/v1/customers/external/#{external_id}"
        response = @client.request("PATCH", url, body: body.to_json)
        result = Polar::Models::Customer.from_json(response)
        Log.debug { "update_external completed successfully" }
        result
      end

      # Delete Customer by External ID
      #
      # Delete a customer by external ID.
      #
      # Immediately cancels any active subscriptions and revokes any active benefits.
      #
      # Scopes: customers:write
      #
      # **Endpoint:** `DELETE /v1/customers/external/{external_id}`
      #
      # **Parameters:**
      # - `external_id` (required): The customer external ID.
      #
      # **Returns:** JSON response string
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def delete_external(external_id : String)
        Log.debug { "Calling delete_external" }
        url = "/v1/customers/external/#{external_id}"
        response = @client.request("DELETE", url)
        Log.debug { "delete_external completed successfully" }
        response
      end

      # Get Customer State
      #
      # Get a customer state by ID.
      #
      # The customer state includes information about
      # the customer's active subscriptions and benefits.
      #
      # It's the ideal endpoint to use when you need to get a full overview
      # of a customer's status.
      #
      # Scopes: customers:read customers:write
      #
      # **Endpoint:** `GET /v1/customers/{id}/state`
      #
      # **Parameters:**
      # - `id` (required): The customer ID.
      #
      # **Returns:** Polar::Models::CustomerState
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def get_state(id : String) : Polar::Models::CustomerState
        Log.debug { "Calling get_state" }
        url = "/v1/customers/#{id}/state"
        response = @client.request("GET", url)
        result = Polar::Models::CustomerState.from_json(response)
        Log.debug { "get_state completed successfully" }
        result
      end

      # Get Customer State by External ID
      #
      # Get a customer state by external ID.
      #
      # The customer state includes information about
      # the customer's active subscriptions and benefits.
      #
      # It's the ideal endpoint to use when you need to get a full overview
      # of a customer's status.
      #
      # Scopes: customers:read customers:write
      #
      # **Endpoint:** `GET /v1/customers/external/{external_id}/state`
      #
      # **Parameters:**
      # - `external_id` (required): The customer external ID.
      #
      # **Returns:** Polar::Models::CustomerState
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def get_state_external(external_id : String) : Polar::Models::CustomerState
        Log.debug { "Calling get_state_external" }
        url = "/v1/customers/external/#{external_id}/state"
        response = @client.request("GET", url)
        result = Polar::Models::CustomerState.from_json(response)
        Log.debug { "get_state_external completed successfully" }
        result
      end

      # Get Customer Balance
      #
      # Get customer balance information.
      #
      # Scopes: customers:read customers:write
      #
      # **Endpoint:** `GET /v1/customers/{id}/balance`
      #
      # **Parameters:**
      # - `id` (required): The customer ID.
      #
      # **Returns:** Polar::Models::CustomerBalance
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def get_balance(id : String) : Polar::Models::CustomerBalance
        Log.debug { "Calling get_balance" }
        url = "/v1/customers/#{id}/balance"
        response = @client.request("GET", url)
        result = Polar::Models::CustomerBalance.from_json(response)
        Log.debug { "get_balance completed successfully" }
        result
      end
    end
  end

  # Extend Client class with customers API accessor
  class Client
    # Access the customers API
    #
    # @return [Api::Customers] The customers API client
    def customers : Api::Customers
      Api::Customers.new(self)
    end
  end
end
