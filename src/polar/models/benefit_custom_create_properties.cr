# BenefitCustomCreateProperties
#
# Properties for creating a benefit of type custom.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a BenefitCustomCreateProperties
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct BenefitCustomCreateProperties
      include JSON::Serializable
      @[JSON::Field(key: "note")]
      getter note : JSON::Any?
    end
  end
end
