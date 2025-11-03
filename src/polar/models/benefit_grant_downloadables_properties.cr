# BenefitGrantDownloadablesProperties
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a BenefitGrantDownloadablesProperties
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct BenefitGrantDownloadablesProperties
      include JSON::Serializable
      @[JSON::Field(key: "files")]
      getter files : Array(String)?
    end
  end
end
