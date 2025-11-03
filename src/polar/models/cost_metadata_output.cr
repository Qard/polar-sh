# CostMetadataOutput
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CostMetadataOutput
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CostMetadataOutput
      include JSON::Serializable
      # The amount in cents.
      @[JSON::Field(key: "amount")]
      getter amount : String

      # The currency. Currently, only usd is supported.
      @[JSON::Field(key: "currency")]
      getter currency : String
    end
  end
end
