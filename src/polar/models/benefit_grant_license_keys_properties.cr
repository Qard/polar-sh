# BenefitGrantLicenseKeysProperties
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a BenefitGrantLicenseKeysProperties
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct BenefitGrantLicenseKeysProperties
      include JSON::Serializable
      @[JSON::Field(key: "license_key_id")]
      getter license_key_id : String?

      @[JSON::Field(key: "display_key")]
      getter display_key : String?
    end
  end
end
