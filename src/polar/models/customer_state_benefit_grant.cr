# CustomerStateBenefitGrant
#
# An active benefit grant for a customer.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomerStateBenefitGrant
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomerStateBenefitGrant
      include JSON::Serializable
      # The ID of the grant.
      @[JSON::Field(key: "id")]
      getter id : String

      # Creation timestamp of the object.
      @[JSON::Field(key: "created_at")]
      getter created_at : Time

      # Last modification timestamp of the object.
      @[JSON::Field(key: "modified_at")]
      getter modified_at : JSON::Any

      # The timestamp when the benefit was granted.
      @[JSON::Field(key: "granted_at")]
      getter granted_at : Time

      # The ID of the benefit concerned by this grant.
      @[JSON::Field(key: "benefit_id")]
      getter benefit_id : String

      # The type of the benefit concerned by this grant.
      @[JSON::Field(key: "benefit_type")]
      getter benefit_type : BenefitType

      # The metadata of the benefit concerned by this grant.
      @[JSON::Field(key: "benefit_metadata")]
      getter benefit_metadata : Hash(String, JSON::Any)

      @[JSON::Field(key: "properties")]
      getter properties : JSON::Any
    end
  end
end
