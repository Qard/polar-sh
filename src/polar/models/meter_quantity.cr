# MeterQuantity
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a MeterQuantity
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct MeterQuantity
      include JSON::Serializable
      # The timestamp for the current period.
      @[JSON::Field(key: "timestamp")]
      getter timestamp : Time

      # The quantity for the current period.
      @[JSON::Field(key: "quantity")]
      getter quantity : Float64
    end
  end
end
