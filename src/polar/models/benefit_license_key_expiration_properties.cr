# BenefitLicenseKeyExpirationProperties
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a BenefitLicenseKeyExpirationProperties
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct BenefitLicenseKeyExpirationProperties
      include JSON::Serializable
      @[JSON::Field(key: "ttl")]
      getter ttl : Int64

      @[JSON::Field(key: "timeframe")]
      getter timeframe : String
    end
  end
end
