# CustomerSubscriptionCancel
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomerSubscriptionCancel
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomerSubscriptionCancel
      include JSON::Serializable
      # Cancel an active subscription once the current period ends.
      #
      # Or uncancel a subscription currently set to be revoked at period end.
      @[JSON::Field(key: "cancel_at_period_end")]
      getter cancel_at_period_end : JSON::Any?

      # Customers reason for cancellation.
      #
      #  too_expensive: Too expensive for the customer.
      #  missing_features: Customer is missing certain features.
      #  switched_service: Customer switched to another service.
      #  unused: Customer is not using it enough.
      #  customer_service: Customer is not satisfied with the customer service.
      #  low_quality: Customer is unhappy with the quality.
      #  too_complex: Customer considers the service too complicated.
      #  other: Other reason(s).
      @[JSON::Field(key: "cancellation_reason")]
      getter cancellation_reason : JSON::Any?

      # Customer feedback and why they decided to cancel.
      @[JSON::Field(key: "cancellation_comment")]
      getter cancellation_comment : JSON::Any?
    end
  end
end
