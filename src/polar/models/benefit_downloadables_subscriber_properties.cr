# BenefitDownloadablesSubscriberProperties
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a BenefitDownloadablesSubscriberProperties
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct BenefitDownloadablesSubscriberProperties
      include JSON::Serializable
      @[JSON::Field(key: "active_files")]
      getter active_files : Array(String)
    end
  end
end
