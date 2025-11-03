# LegacyRecurringProductPriceFree
#
# A free recurring price for a product, i.e. a subscription.
#
# Deprecated: The recurring interval should be set on the product itself.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a LegacyRecurringProductPriceFree
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct LegacyRecurringProductPriceFree
      include JSON::Serializable
      # Creation timestamp of the object.
      @[JSON::Field(key: "created_at")]
      getter created_at : Time

      # Last modification timestamp of the object.
      @[JSON::Field(key: "modified_at")]
      getter modified_at : JSON::Any

      # The ID of the price.
      @[JSON::Field(key: "id")]
      getter id : String

      @[JSON::Field(key: "amount_type")]
      getter amount_type : String

      # Whether the price is archived and no longer available.
      @[JSON::Field(key: "is_archived")]
      getter is_archived : Bool

      # The ID of the product owning the price.
      @[JSON::Field(key: "product_id")]
      getter product_id : String

      # The type of the price.
      @[JSON::Field(key: "type")]
      getter type : String

      # The recurring interval of the price.
      @[JSON::Field(key: "recurring_interval")]
      getter recurring_interval : SubscriptionRecurringInterval

      @[JSON::Field(key: "legacy")]
      getter legacy : Bool
    end
  end
end
