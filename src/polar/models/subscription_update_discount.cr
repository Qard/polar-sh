# SubscriptionUpdateDiscount
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a SubscriptionUpdateDiscount
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct SubscriptionUpdateDiscount
      include JSON::Serializable
      # Update the subscription to apply a new discount. If set to null, the discount will be removed. The change will be applied on the next billing cycle.
      @[JSON::Field(key: "discount_id")]
      getter discount_id : JSON::Any
    end
  end
end
