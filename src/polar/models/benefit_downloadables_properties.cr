# BenefitDownloadablesProperties
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a BenefitDownloadablesProperties
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct BenefitDownloadablesProperties
      include JSON::Serializable
      @[JSON::Field(key: "archived")]
      getter archived : Hash(String, Bool)

      @[JSON::Field(key: "files")]
      getter files : Array(String)
    end
  end
end
