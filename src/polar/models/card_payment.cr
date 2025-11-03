# CardPayment
#
# Schema of a payment with a card payment method.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CardPayment
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CardPayment
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

      # The payment processor.
      @[JSON::Field(key: "processor")]
      getter processor : PaymentProcessor

      # The payment status.
      @[JSON::Field(key: "status")]
      getter status : PaymentStatus

      # The payment amount in cents.
      @[JSON::Field(key: "amount")]
      getter amount : Int64

      # The payment currency. Currently, only usd is supported.
      @[JSON::Field(key: "currency")]
      getter currency : String

      # The payment method used.
      @[JSON::Field(key: "method")]
      getter method : String

      # Error code, if the payment was declined.
      @[JSON::Field(key: "decline_reason")]
      getter decline_reason : JSON::Any

      # Human-reasable error message, if the payment was declined.
      @[JSON::Field(key: "decline_message")]
      getter decline_message : JSON::Any

      # The ID of the organization that owns the payment.
      @[JSON::Field(key: "organization_id")]
      getter organization_id : String

      # The ID of the checkout session associated with this payment.
      @[JSON::Field(key: "checkout_id")]
      getter checkout_id : JSON::Any

      # The ID of the order associated with this payment.
      @[JSON::Field(key: "order_id")]
      getter order_id : JSON::Any

      # Additional metadata from the payment processor for internal use.
      @[JSON::Field(key: "processor_metadata")]
      getter processor_metadata : Hash(String, JSON::Any)?

      # Additional metadata for the card payment method.
      @[JSON::Field(key: "method_metadata")]
      getter method_metadata : CardPaymentMetadata
    end
  end
end
