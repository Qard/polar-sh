# CustomerSeats
#
# API client for customer_seats resource operations.
#
# This class provides methods for interacting with customer_seats-related endpoints
# in the Polar.sh API. All methods return JSON response strings that can be
# parsed into appropriate model types.
#
# Auto-generated from OpenAPI spec
module Polar
  module Api
    # API client for customer_seats operations
    class CustomerSeats
      Log = ::Log.for(self)

      # Creates a new CustomerSeats instance
      #
      # @param client [Client] The Polar API client instance
      def initialize(@client : Client)
        Log.debug { "Initialized CustomerSeats API client" }
      end

      # Assign Seat
      #
      # Scopes: customer_seats:write
      #
      # **Endpoint:** `POST /v1/customer-seats`
      #
      # **Parameters:**
      # - `body` (required): Request body as Polar::Models::SeatAssign
      #
      # **Returns:** Polar::Models::CustomerSeat
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def assign_seat(body : Polar::Models::SeatAssign) : Polar::Models::CustomerSeat
        Log.debug { "Calling assign_seat" }
        url = "/v1/customer-seats"
        response = @client.request("POST", url, body: body.to_json)
        result = Polar::Models::CustomerSeat.from_json(response)
        Log.debug { "assign_seat completed successfully" }
        result
      end

      # List Seats
      #
      # Scopes: customer_seats:write
      #
      # **Endpoint:** `GET /v1/customer-seats`
      #
      # **Parameters:**
      # - `subscription_id` (optional): Query parameter
      # - `order_id` (optional): Query parameter
      #
      # **Returns:** Polar::Models::SeatsList
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def list_seats(subscription_id : String? = nil, order_id : String? = nil) : Polar::Models::SeatsList
        Log.debug { "Calling list_seats" }
        url = "/v1/customer-seats"
        query_params = {} of String => String
        query_params["subscription_id"] = subscription_id.to_s if subscription_id
        query_params["order_id"] = order_id.to_s if order_id
        url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
        Log.trace { "Query params: #{query_params}" }
        response = @client.request("GET", url)
        result = Polar::Models::SeatsList.from_json(response)
        Log.debug { "list_seats completed successfully" }
        result
      end

      # Revoke Seat
      #
      # Scopes: customer_seats:write
      #
      # **Endpoint:** `DELETE /v1/customer-seats/{seat_id}`
      #
      # **Parameters:**
      # - `seat_id` (required): Path parameter
      #
      # **Returns:** Polar::Models::CustomerSeat
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def revoke_seat(seat_id : String) : Polar::Models::CustomerSeat
        Log.debug { "Calling revoke_seat" }
        url = "/v1/customer-seats/#{seat_id}"
        response = @client.request("DELETE", url)
        result = Polar::Models::CustomerSeat.from_json(response)
        Log.debug { "revoke_seat completed successfully" }
        result
      end

      # Resend Invitation
      #
      # Scopes: customer_seats:write
      #
      # **Endpoint:** `POST /v1/customer-seats/{seat_id}/resend`
      #
      # **Parameters:**
      # - `seat_id` (required): Path parameter
      #
      # **Returns:** Polar::Models::CustomerSeat
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def resend_invitation(seat_id : String) : Polar::Models::CustomerSeat
        Log.debug { "Calling resend_invitation" }
        url = "/v1/customer-seats/#{seat_id}/resend"
        response = @client.request("POST", url)
        result = Polar::Models::CustomerSeat.from_json(response)
        Log.debug { "resend_invitation completed successfully" }
        result
      end

      # Get Claim Info
      #
      # **Endpoint:** `GET /v1/customer-seats/claim/{invitation_token}`
      #
      # **Parameters:**
      # - `invitation_token` (required): Path parameter
      #
      # **Returns:** Polar::Models::SeatClaimInfo
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def get_claim_info(invitation_token : String) : Polar::Models::SeatClaimInfo
        Log.debug { "Calling get_claim_info" }
        url = "/v1/customer-seats/claim/#{invitation_token}"
        response = @client.request("GET", url)
        result = Polar::Models::SeatClaimInfo.from_json(response)
        Log.debug { "get_claim_info completed successfully" }
        result
      end

      # Claim Seat
      #
      # **Endpoint:** `POST /v1/customer-seats/claim`
      #
      # **Parameters:**
      # - `body` (required): Request body as Polar::Models::SeatClaim
      #
      # **Returns:** Polar::Models::CustomerSeatClaimResponse
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def claim_seat(body : Polar::Models::SeatClaim) : Polar::Models::CustomerSeatClaimResponse
        Log.debug { "Calling claim_seat" }
        url = "/v1/customer-seats/claim"
        response = @client.request("POST", url, body: body.to_json)
        result = Polar::Models::CustomerSeatClaimResponse.from_json(response)
        Log.debug { "claim_seat completed successfully" }
        result
      end
    end
  end

  # Extend Client class with customer_seats API accessor
  class Client
    # Access the customer_seats API
    #
    # @return [Api::CustomerSeats] The customer_seats API client
    def customer_seats : Api::CustomerSeats
      Api::CustomerSeats.new(self)
    end
  end
end
