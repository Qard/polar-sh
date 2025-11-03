# SeatAssign
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a SeatAssign
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct SeatAssign
      include JSON::Serializable
      # Subscription ID. Required if checkout_id and order_id are not provided.
      @[JSON::Field(key: "subscription_id")]
      getter subscription_id : JSON::Any?

      # Checkout ID. Used to look up subscription or order from the checkout page.
      @[JSON::Field(key: "checkout_id")]
      getter checkout_id : JSON::Any?

      # Order ID for one-time purchases. Required if subscription_id and checkout_id are not provided.
      @[JSON::Field(key: "order_id")]
      getter order_id : JSON::Any?

      # Email of the customer to assign the seat to
      @[JSON::Field(key: "email")]
      getter email : JSON::Any?

      # External customer ID for the seat assignment
      @[JSON::Field(key: "external_customer_id")]
      getter external_customer_id : JSON::Any?

      # Customer ID for the seat assignment
      @[JSON::Field(key: "customer_id")]
      getter customer_id : JSON::Any?

      # Additional metadata for the seat (max 10 keys, 1KB total)
      @[JSON::Field(key: "metadata")]
      getter metadata : JSON::Any?

      # If true, the seat will be immediately claimed without sending an invitation email. API-only feature.
      @[JSON::Field(key: "immediate_claim")]
      getter immediate_claim : Bool?
    end
  end
end
