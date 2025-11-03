# CustomFields
#
# API client for custom_fields resource operations.
#
# This class provides methods for interacting with custom_fields-related endpoints
# in the Polar.sh API. All methods return JSON response strings that can be
# parsed into appropriate model types.
#
# Auto-generated from OpenAPI spec
module Polar
  module Api
    # API client for custom_fields operations
    class CustomFields
      Log = ::Log.for(self)

      # Creates a new CustomFields instance
      #
      # @param client [Client] The Polar API client instance
      def initialize(@client : Client)
        Log.debug { "Initialized CustomFields API client" }
      end

      # List Custom Fields
      #
      # List custom fields.
      #
      # Scopes: custom_fields:read custom_fields:write
      #
      # **Endpoint:** `GET /v1/custom-fields/`
      #
      # **Parameters:**
      # - `organization_id` (optional): Filter by organization ID.
      # - `query` (optional): Filter by custom field name or slug.
      # - `type` (optional): Filter by custom field type.
      # - `page` (optional): Page number, defaults to 1.
      # - `limit` (optional): Size of a page, defaults to 10. Maximum is 100.
      # - `sorting` (optional): Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign - before the criteria name to sort by descending order.
      #
      # **Returns:** Polar::Models::ListResource(Polar::Models::CustomField)
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def list(organization_id : String? = nil, query : String? = nil, type : String? = nil, page : Int32? = nil, limit : Int32? = nil, sorting : String? = nil) : Polar::Models::ListResource(Polar::Models::CustomField)
        Log.debug { "Calling list" }
        url = "/v1/custom-fields/"
        query_params = {} of String => String
        query_params["organization_id"] = organization_id.to_s if organization_id
        query_params["query"] = query.to_s if query
        query_params["type"] = type.to_s if type
        query_params["page"] = page.to_s if page
        query_params["limit"] = limit.to_s if limit
        query_params["sorting"] = sorting.to_s if sorting
        url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
        Log.trace { "Query params: #{query_params}" }
        response = @client.request("GET", url)
        result = Polar::Models::ListResource(Polar::Models::CustomField).from_json(response)
        Log.debug { "list completed successfully" }
        result
      end

      # Create Custom Field
      #
      # Create a custom field.
      #
      # Scopes: custom_fields:write
      #
      # **Endpoint:** `POST /v1/custom-fields/`
      #
      # **Parameters:**
      # - `body` (required): Request body as Polar::Models::CustomFieldCreate
      #
      # **Returns:** Polar::Models::CustomField
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def create(body : Polar::Models::CustomFieldCreate) : Polar::Models::CustomField
        Log.debug { "Calling create" }
        url = "/v1/custom-fields/"
        response = @client.request("POST", url, body: body.to_json)
        result = Polar::Models::CustomField.from_json(response)
        Log.debug { "create completed successfully" }
        result
      end

      # Get Custom Field
      #
      # Get a custom field by ID.
      #
      # Scopes: custom_fields:read custom_fields:write
      #
      # **Endpoint:** `GET /v1/custom-fields/{id}`
      #
      # **Parameters:**
      # - `id` (required): The custom field ID.
      #
      # **Returns:** Polar::Models::CustomField
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def get(id : String) : Polar::Models::CustomField
        Log.debug { "Calling get" }
        url = "/v1/custom-fields/#{id}"
        response = @client.request("GET", url)
        result = Polar::Models::CustomField.from_json(response)
        Log.debug { "get completed successfully" }
        result
      end

      # Update Custom Field
      #
      # Update a custom field.
      #
      # Scopes: custom_fields:write
      #
      # **Endpoint:** `PATCH /v1/custom-fields/{id}`
      #
      # **Parameters:**
      # - `id` (required): The custom field ID.
      # - `body` (required): Request body as Polar::Models::CustomFieldUpdate
      #
      # **Returns:** Polar::Models::CustomField
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def update(id : String, body : Polar::Models::CustomFieldUpdate) : Polar::Models::CustomField
        Log.debug { "Calling update" }
        url = "/v1/custom-fields/#{id}"
        response = @client.request("PATCH", url, body: body.to_json)
        result = Polar::Models::CustomField.from_json(response)
        Log.debug { "update completed successfully" }
        result
      end

      # Delete Custom Field
      #
      # Delete a custom field.
      #
      # Scopes: custom_fields:write
      #
      # **Endpoint:** `DELETE /v1/custom-fields/{id}`
      #
      # **Parameters:**
      # - `id` (required): The custom field ID.
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
        url = "/v1/custom-fields/#{id}"
        response = @client.request("DELETE", url)
        Log.debug { "delete completed successfully" }
        response
      end
    end
  end

  # Extend Client class with custom_fields API accessor
  class Client
    # Access the custom_fields API
    #
    # @return [Api::CustomFields] The custom_fields API client
    def custom_fields : Api::CustomFields
      Api::CustomFields.new(self)
    end
  end
end
