# CountAggregation
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CountAggregation
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CountAggregation
      include JSON::Serializable
      @[JSON::Field(key: "func")]
      getter func : String?
    end
  end
end
