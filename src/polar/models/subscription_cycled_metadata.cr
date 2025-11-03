# SubscriptionCycledMetadata
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a SubscriptionCycledMetadata
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct SubscriptionCycledMetadata
      include JSON::Serializable
      @[JSON::Field(key: "subscription_id")]
      getter subscription_id : String
    end
  end
end
