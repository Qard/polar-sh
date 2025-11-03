# BenefitGrantMeterCreditProperties
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a BenefitGrantMeterCreditProperties
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct BenefitGrantMeterCreditProperties
      include JSON::Serializable
      @[JSON::Field(key: "last_credited_meter_id")]
      getter last_credited_meter_id : String?

      @[JSON::Field(key: "last_credited_units")]
      getter last_credited_units : Int64?

      @[JSON::Field(key: "last_credited_at")]
      getter last_credited_at : String?
    end
  end
end
