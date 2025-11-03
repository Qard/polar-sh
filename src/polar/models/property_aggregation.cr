# PropertyAggregation
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a PropertyAggregation
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct PropertyAggregation
      include JSON::Serializable
      @[JSON::Field(key: "func")]
      getter func : String

      @[JSON::Field(key: "property")]
      getter property : String
    end
  end
end
