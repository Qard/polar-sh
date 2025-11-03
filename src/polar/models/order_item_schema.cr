# OrderItemSchema
#
# An order line item.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a OrderItemSchema
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct OrderItemSchema
      include JSON::Serializable
      # Creation timestamp of the object.
      @[JSON::Field(key: "created_at")]
      getter created_at : Time

      # Last modification timestamp of the object.
      @[JSON::Field(key: "modified_at")]
      getter modified_at : JSON::Any

      # The ID of the object.
      @[JSON::Field(key: "id")]
      getter id : String

      # Description of the line item charge.
      @[JSON::Field(key: "label")]
      getter label : String

      # Amount in cents, before discounts and taxes.
      @[JSON::Field(key: "amount")]
      getter amount : Int64

      # Sales tax amount in cents.
      @[JSON::Field(key: "tax_amount")]
      getter tax_amount : Int64

      # Whether this charge is due to a proration.
      @[JSON::Field(key: "proration")]
      getter proration : Bool

      # Associated price ID, if any.
      @[JSON::Field(key: "product_price_id")]
      getter product_price_id : JSON::Any
    end
  end
end
