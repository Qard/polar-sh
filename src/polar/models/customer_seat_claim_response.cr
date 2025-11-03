# CustomerSeatClaimResponse
#
# Response after successfully claiming a seat.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomerSeatClaimResponse
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomerSeatClaimResponse
      include JSON::Serializable
      # The claimed seat
      @[JSON::Field(key: "seat")]
      getter seat : CustomerSeat

      # Session token for immediate customer portal access
      @[JSON::Field(key: "customer_session_token")]
      getter customer_session_token : String
    end
  end
end
