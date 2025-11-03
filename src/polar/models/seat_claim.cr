# SeatClaim
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a SeatClaim
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct SeatClaim
      include JSON::Serializable
      # Invitation token to claim the seat
      @[JSON::Field(key: "invitation_token")]
      getter invitation_token : String
    end
  end
end
