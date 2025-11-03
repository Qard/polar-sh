# BenefitMeterCreditCreateProperties
#
# Properties for creating a benefit of type meter_unit.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a BenefitMeterCreditCreateProperties
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct BenefitMeterCreditCreateProperties
      include JSON::Serializable
      @[JSON::Field(key: "units")]
      getter units : Int64

      @[JSON::Field(key: "rollover")]
      getter rollover : Bool

      @[JSON::Field(key: "meter_id")]
      getter meter_id : String
    end
  end
end
