# BenefitCustomProperties
#
# Properties for a benefit of type custom.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a BenefitCustomProperties
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct BenefitCustomProperties
      include JSON::Serializable
      @[JSON::Field(key: "note")]
      getter note : JSON::Any
    end
  end
end
