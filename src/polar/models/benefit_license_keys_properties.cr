# BenefitLicenseKeysProperties
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a BenefitLicenseKeysProperties
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct BenefitLicenseKeysProperties
      include JSON::Serializable
      @[JSON::Field(key: "prefix")]
      getter prefix : JSON::Any

      @[JSON::Field(key: "expires")]
      getter expires : JSON::Any

      @[JSON::Field(key: "activations")]
      getter activations : JSON::Any

      @[JSON::Field(key: "limit_usage")]
      getter limit_usage : JSON::Any
    end
  end
end
