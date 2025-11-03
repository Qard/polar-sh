# BenefitGrantError
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a BenefitGrantError
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct BenefitGrantError
      include JSON::Serializable
      @[JSON::Field(key: "message")]
      getter message : String

      @[JSON::Field(key: "type")]
      getter type : String

      @[JSON::Field(key: "timestamp")]
      getter timestamp : String
    end
  end
end
