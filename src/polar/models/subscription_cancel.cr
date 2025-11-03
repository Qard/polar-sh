# SubscriptionCancel
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a SubscriptionCancel
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct SubscriptionCancel
      include JSON::Serializable
      # Customer reason for cancellation.
      #
      # Helpful to monitor reasons behind churn for future improvements.
      #
      # Only set this in case your own service is requesting the reason from the
      # customer. Or you know based on direct conversations, i.e support, with
      # the customer.
      #
      #  too_expensive: Too expensive for the customer.
      #  missing_features: Customer is missing certain features.
      #  switched_service: Customer switched to another service.
      #  unused: Customer is not using it enough.
      #  customer_service: Customer is not satisfied with the customer service.
      #  low_quality: Customer is unhappy with the quality.
      #  too_complex: Customer considers the service too complicated.
      #  other: Other reason(s).
      @[JSON::Field(key: "customer_cancellation_reason")]
      getter customer_cancellation_reason : JSON::Any?

      # Customer feedback and why they decided to cancel.
      #
      # IMPORTANT:
      # Do not use this to store internal notes! It's intended to be input
      # from the customer and is therefore also available in their Polar
      # purchases library.
      #
      # Only set this in case your own service is requesting the reason from the
      # customer. Or you copy a message directly from a customer
      # conversation, i.e support.
      @[JSON::Field(key: "customer_cancellation_comment")]
      getter customer_cancellation_comment : JSON::Any?

      # Cancel an active subscription once the current period ends.
      #
      # Or uncancel a subscription currently set to be revoked at period end.
      @[JSON::Field(key: "cancel_at_period_end")]
      getter cancel_at_period_end : Bool
    end
  end
end
