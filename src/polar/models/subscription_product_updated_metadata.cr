# SubscriptionProductUpdatedMetadata
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a SubscriptionProductUpdatedMetadata
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct SubscriptionProductUpdatedMetadata
      include JSON::Serializable
      @[JSON::Field(key: "subscription_id")]
      getter subscription_id : String

      @[JSON::Field(key: "old_product_id")]
      getter old_product_id : String

      @[JSON::Field(key: "new_product_id")]
      getter new_product_id : String
    end
  end
end
