# Organizations
#
# API client for organizations resource operations.
#
# This class provides methods for interacting with organizations-related endpoints
# in the Polar.sh API. All methods return JSON response strings that can be
# parsed into appropriate model types.
#
# Auto-generated from OpenAPI spec
module Polar
  module Api
    # API client for organizations operations
    class Organizations
      Log = ::Log.for(self)

      # Creates a new Organizations instance
      #
      # @param client [Client] The Polar API client instance
      def initialize(@client : Client)
        Log.debug { "Initialized Organizations API client" }
      end

      # List Organizations
      #
      # List organizations.
      #
      # Scopes: organizations:read organizations:write
      #
      # **Endpoint:** `GET /v1/organizations/`
      #
      # **Parameters:**
      # - `slug` (optional): Filter by slug.
      # - `page` (optional): Page number, defaults to 1.
      # - `limit` (optional): Size of a page, defaults to 10. Maximum is 100.
      # - `sorting` (optional): Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign - before the criteria name to sort by descending order.
      #
      # **Returns:** Polar::Models::ListResource(Polar::Models::Organization)
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def list(slug : String? = nil, page : Int32? = nil, limit : Int32? = nil, sorting : String? = nil) : Polar::Models::ListResource(Polar::Models::Organization)
        Log.debug { "Calling list" }
        url = "/v1/organizations/"
        query_params = {} of String => String
        query_params["slug"] = slug.to_s if slug
        query_params["page"] = page.to_s if page
        query_params["limit"] = limit.to_s if limit
        query_params["sorting"] = sorting.to_s if sorting
        url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
        Log.trace { "Query params: #{query_params}" }
        response = @client.request("GET", url)
        result = Polar::Models::ListResource(Polar::Models::Organization).from_json(response)
        Log.debug { "list completed successfully" }
        result
      end

      # Create Organization
      #
      # Create an organization.
      #
      # Scopes: organizations:write
      #
      # **Endpoint:** `POST /v1/organizations/`
      #
      # **Parameters:**
      # - `body` (required): Request body as Polar::Models::OrganizationCreate
      #
      # **Returns:** Polar::Models::Organization
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def create(body : Polar::Models::OrganizationCreate) : Polar::Models::Organization
        Log.debug { "Calling create" }
        url = "/v1/organizations/"
        response = @client.request("POST", url, body: body.to_json)
        result = Polar::Models::Organization.from_json(response)
        Log.debug { "create completed successfully" }
        result
      end

      # Get Organization
      #
      # Get an organization by ID.
      #
      # Scopes: organizations:read organizations:write
      #
      # **Endpoint:** `GET /v1/organizations/{id}`
      #
      # **Parameters:**
      # - `id` (required): Path parameter
      #
      # **Returns:** Polar::Models::Organization
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def get(id : String) : Polar::Models::Organization
        Log.debug { "Calling get" }
        url = "/v1/organizations/#{id}"
        response = @client.request("GET", url)
        result = Polar::Models::Organization.from_json(response)
        Log.debug { "get completed successfully" }
        result
      end

      # Update Organization
      #
      # Update an organization.
      #
      # Scopes: organizations:write
      #
      # **Endpoint:** `PATCH /v1/organizations/{id}`
      #
      # **Parameters:**
      # - `id` (required): Path parameter
      # - `body` (required): Request body as Polar::Models::OrganizationUpdate
      #
      # **Returns:** Polar::Models::Organization
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def update(id : String, body : Polar::Models::OrganizationUpdate) : Polar::Models::Organization
        Log.debug { "Calling update" }
        url = "/v1/organizations/#{id}"
        response = @client.request("PATCH", url, body: body.to_json)
        result = Polar::Models::Organization.from_json(response)
        Log.debug { "update completed successfully" }
        result
      end
    end
  end

  # Extend Client class with organizations API accessor
  class Client
    # Access the organizations API
    #
    # @return [Api::Organizations] The organizations API client
    def organizations : Api::Organizations
      Api::Organizations.new(self)
    end
  end
end
