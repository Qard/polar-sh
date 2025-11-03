# MeterQuantities
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a MeterQuantities
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct MeterQuantities
      include JSON::Serializable
      @[JSON::Field(key: "quantities")]
      getter quantities : Array(MeterQuantity)

      # The total quantity for the period.
      @[JSON::Field(key: "total")]
      getter total : Float64
    end
  end
end
