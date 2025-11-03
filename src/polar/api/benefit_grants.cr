# BenefitGrants
#
# API client for benefit_grants resource operations.
#
# This class provides methods for interacting with benefit_grants-related endpoints
# in the Polar.sh API. All methods return JSON response strings that can be
# parsed into appropriate model types.
#
# Auto-generated from OpenAPI spec
module Polar
  module Api
    # API client for benefit_grants operations
    class BenefitGrants
      Log = ::Log.for(self)

      # Creates a new BenefitGrants instance
      #
      # @param client [Client] The Polar API client instance
      def initialize(@client : Client)
        Log.debug { "Initialized BenefitGrants API client" }
      end

      # List Benefit Grants
      #
      # List benefit grants across all benefits for the authenticated organization.
      #
      # Scopes: benefits:read benefits:write
      #
      # **Endpoint:** `GET /v1/benefit-grants/`
      #
      # **Parameters:**
      # - `organization_id` (optional): Filter by organization ID.
      # - `customer_id` (optional): Filter by customer ID.
      # - `is_granted` (optional): Filter by granted status. If true, only granted benefits will be returned. If false, only revoked benefits will be returned.
      # - `page` (optional): Page number, defaults to 1.
      # - `limit` (optional): Size of a page, defaults to 10. Maximum is 100.
      # - `sorting` (optional): Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign - before the criteria name to sort by descending order.
      #
      # **Returns:** Polar::Models::ListResource(Polar::Models::BenefitGrant)
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def list(organization_id : String? = nil, customer_id : String? = nil, is_granted : String? = nil, page : Int32? = nil, limit : Int32? = nil, sorting : String? = nil) : Polar::Models::ListResource(Polar::Models::BenefitGrant)
        Log.debug { "Calling list" }
        url = "/v1/benefit-grants/"
        query_params = {} of String => String
        query_params["organization_id"] = organization_id.to_s if organization_id
        query_params["customer_id"] = customer_id.to_s if customer_id
        query_params["is_granted"] = is_granted.to_s if is_granted
        query_params["page"] = page.to_s if page
        query_params["limit"] = limit.to_s if limit
        query_params["sorting"] = sorting.to_s if sorting
        url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
        Log.trace { "Query params: #{query_params}" }
        response = @client.request("GET", url)
        result = Polar::Models::ListResource(Polar::Models::BenefitGrant).from_json(response)
        Log.debug { "list completed successfully" }
        result
      end
    end
  end

  # Extend Client class with benefit_grants API accessor
  class Client
    # Access the benefit_grants API
    #
    # @return [Api::BenefitGrants] The benefit_grants API client
    def benefit_grants : Api::BenefitGrants
      Api::BenefitGrants.new(self)
    end
  end
end
