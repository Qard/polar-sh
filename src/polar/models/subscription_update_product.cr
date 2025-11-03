# SubscriptionUpdateProduct
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a SubscriptionUpdateProduct
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct SubscriptionUpdateProduct
      include JSON::Serializable
      # Update subscription to another product.
      @[JSON::Field(key: "product_id")]
      getter product_id : String

      # Determine how to handle the proration billing. If not provided, will use the default organization setting.
      @[JSON::Field(key: "proration_behavior")]
      getter proration_behavior : JSON::Any?
    end
  end
end
