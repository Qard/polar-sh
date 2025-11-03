# SeatClaimInfo
#
# Read-only information about a seat claim invitation.
# Safe for email scanners - no side effects when fetched.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a SeatClaimInfo
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct SeatClaimInfo
      include JSON::Serializable
      # Name of the product
      @[JSON::Field(key: "product_name")]
      getter product_name : String

      # ID of the product
      @[JSON::Field(key: "product_id")]
      getter product_id : String

      # Name of the organization
      @[JSON::Field(key: "organization_name")]
      getter organization_name : String

      # Slug of the organization
      @[JSON::Field(key: "organization_slug")]
      getter organization_slug : String

      # Email of the customer assigned to this seat
      @[JSON::Field(key: "customer_email")]
      getter customer_email : String

      # Whether the seat can be claimed
      @[JSON::Field(key: "can_claim")]
      getter can_claim : Bool
    end
  end
end
