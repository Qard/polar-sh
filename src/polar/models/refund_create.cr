# RefundCreate
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a RefundCreate
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct RefundCreate
      include JSON::Serializable
      # Key-value object allowing you to store additional information.
      #
      # The key must be a string with a maximum length of 40 characters.
      # The value must be either:
      #
      #  A string with a maximum length of 500 characters
      #  An integer
      #  A floating-point number
      #  A boolean
      #
      # You can store up to 50 key-value pairs.
      @[JSON::Field(key: "metadata")]
      getter metadata : Hash(String, JSON::Any)?

      @[JSON::Field(key: "order_id")]
      getter order_id : String

      @[JSON::Field(key: "reason")]
      getter reason : RefundReason

      # Amount to refund in cents. Minimum is 1.
      @[JSON::Field(key: "amount")]
      getter amount : Int64

      # An internal comment about the refund.
      @[JSON::Field(key: "comment")]
      getter comment : JSON::Any?

      # Should this refund trigger the associated customer benefits to be revoked?
      #
      # Note:
      # Only allowed in case the order is a one-time purchase.
      # Subscriptions automatically revoke customer benefits once the
      # subscription itself is revoked, i.e fully canceled.
      @[JSON::Field(key: "revoke_benefits")]
      getter revoke_benefits : Bool?
    end
  end
end
