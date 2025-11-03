# CustomerSubscription
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomerSubscription
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomerSubscription
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

      # The amount of the subscription.
      @[JSON::Field(key: "amount")]
      getter amount : Int64

      # The currency of the subscription.
      @[JSON::Field(key: "currency")]
      getter currency : String

      # The interval at which the subscription recurs.
      @[JSON::Field(key: "recurring_interval")]
      getter recurring_interval : SubscriptionRecurringInterval

      # Number of interval units of the subscription. If this is set to 1 the charge will happen every interval (e.g. every month), if set to 2 it will be every other month, and so on.
      @[JSON::Field(key: "recurring_interval_count")]
      getter recurring_interval_count : Int64

      # The status of the subscription.
      @[JSON::Field(key: "status")]
      getter status : SubscriptionStatus

      # The start timestamp of the current billing period.
      @[JSON::Field(key: "current_period_start")]
      getter current_period_start : Time

      # The end timestamp of the current billing period.
      @[JSON::Field(key: "current_period_end")]
      getter current_period_end : JSON::Any

      # The start timestamp of the trial period, if any.
      @[JSON::Field(key: "trial_start")]
      getter trial_start : JSON::Any

      # The end timestamp of the trial period, if any.
      @[JSON::Field(key: "trial_end")]
      getter trial_end : JSON::Any

      # Whether the subscription will be canceled at the end of the current period.
      @[JSON::Field(key: "cancel_at_period_end")]
      getter cancel_at_period_end : Bool

      # The timestamp when the subscription was canceled. The subscription might still be active if cancel_at_period_end is true.
      @[JSON::Field(key: "canceled_at")]
      getter canceled_at : JSON::Any

      # The timestamp when the subscription started.
      @[JSON::Field(key: "started_at")]
      getter started_at : JSON::Any

      # The timestamp when the subscription will end.
      @[JSON::Field(key: "ends_at")]
      getter ends_at : JSON::Any

      # The timestamp when the subscription ended.
      @[JSON::Field(key: "ended_at")]
      getter ended_at : JSON::Any

      # The ID of the subscribed customer.
      @[JSON::Field(key: "customer_id")]
      getter customer_id : String

      # The ID of the subscribed product.
      @[JSON::Field(key: "product_id")]
      getter product_id : String

      # The ID of the applied discount, if any.
      @[JSON::Field(key: "discount_id")]
      getter discount_id : JSON::Any

      @[JSON::Field(key: "checkout_id")]
      getter checkout_id : JSON::Any

      # The number of seats for seat-based subscriptions. None for non-seat subscriptions.
      @[JSON::Field(key: "seats")]
      getter seats : JSON::Any?

      @[JSON::Field(key: "customer_cancellation_reason")]
      getter customer_cancellation_reason : JSON::Any

      @[JSON::Field(key: "customer_cancellation_comment")]
      getter customer_cancellation_comment : JSON::Any

      @[JSON::Field(key: "product")]
      getter product : CustomerSubscriptionProduct

      # List of enabled prices for the subscription.
      @[JSON::Field(key: "prices")]
      getter prices : Array(JSON::Any)

      # List of meters associated with the subscription.
      @[JSON::Field(key: "meters")]
      getter meters : Array(CustomerSubscriptionMeter)

      # Whether the subscription is managed by Polar.
      @[JSON::Field(key: "is_polar_managed")]
      getter is_polar_managed : Bool
    end
  end
end
