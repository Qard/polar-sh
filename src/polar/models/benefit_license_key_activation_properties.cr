# BenefitLicenseKeyActivationProperties
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a BenefitLicenseKeyActivationProperties
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct BenefitLicenseKeyActivationProperties
      include JSON::Serializable
      @[JSON::Field(key: "limit")]
      getter limit : Int64

      @[JSON::Field(key: "enable_customer_admin")]
      getter enable_customer_admin : Bool
    end
  end
end
