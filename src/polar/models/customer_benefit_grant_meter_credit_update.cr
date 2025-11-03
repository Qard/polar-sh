# CustomerBenefitGrantMeterCreditUpdate
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomerBenefitGrantMeterCreditUpdate
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomerBenefitGrantMeterCreditUpdate
      include JSON::Serializable
      @[JSON::Field(key: "benefit_type")]
      getter benefit_type : String
    end
  end
end
