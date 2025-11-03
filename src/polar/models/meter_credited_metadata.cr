# MeterCreditedMetadata
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a MeterCreditedMetadata
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct MeterCreditedMetadata
      include JSON::Serializable
      @[JSON::Field(key: "meter_id")]
      getter meter_id : String

      @[JSON::Field(key: "units")]
      getter units : Int64

      @[JSON::Field(key: "rollover")]
      getter rollover : Bool
    end
  end
end
