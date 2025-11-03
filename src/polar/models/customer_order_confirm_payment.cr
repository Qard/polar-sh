# CustomerOrderConfirmPayment
#
# Schema to confirm a retry payment using either a saved payment method or a new confirmation token.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomerOrderConfirmPayment
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomerOrderConfirmPayment
      include JSON::Serializable
      # ID of the Stripe confirmation token for new payment methods.
      @[JSON::Field(key: "confirmation_token_id")]
      getter confirmation_token_id : JSON::Any?

      # ID of an existing saved payment method.
      @[JSON::Field(key: "payment_method_id")]
      getter payment_method_id : JSON::Any?

      # Payment processor used.
      @[JSON::Field(key: "payment_processor")]
      getter payment_processor : PaymentProcessor?
    end
  end
end
