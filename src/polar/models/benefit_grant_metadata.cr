# BenefitGrantMetadata
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a BenefitGrantMetadata
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct BenefitGrantMetadata
      include JSON::Serializable
      @[JSON::Field(key: "benefit_id")]
      getter benefit_id : String

      @[JSON::Field(key: "benefit_grant_id")]
      getter benefit_grant_id : String

      @[JSON::Field(key: "benefit_type")]
      getter benefit_type : BenefitType
    end
  end
end
