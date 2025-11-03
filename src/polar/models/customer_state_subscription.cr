# CustomerStateSubscription
#
# An active customer subscription.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomerStateSubscription
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomerStateSubscription
      include JSON::Serializable
      # The ID of the subscription.
      @[JSON::Field(key: "id")]
      getter id : String

      # Creation timestamp of the object.
      @[JSON::Field(key: "created_at")]
      getter created_at : Time

      # Last modification timestamp of the object.
      @[JSON::Field(key: "modified_at")]
      getter modified_at : JSON::Any

      # Key-value object storing custom field values.
      @[JSON::Field(key: "custom_field_data")]
      getter custom_field_data : Hash(String, JSON::Any)?

      @[JSON::Field(key: "metadata")]
      getter metadata : Hash(String, JSON::Any)

      @[JSON::Field(key: "status")]
      getter status : String

      # The amount of the subscription.
      @[JSON::Field(key: "amount")]
      getter amount : Int64

      # The currency of the subscription.
      @[JSON::Field(key: "currency")]
      getter currency : String

      # The interval at which the subscription recurs.
      @[JSON::Field(key: "recurring_interval")]
      getter recurring_interval : SubscriptionRecurringInterval

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

      # The ID of the subscribed product.
      @[JSON::Field(key: "product_id")]
      getter product_id : String

      # The ID of the applied discount, if any.
      @[JSON::Field(key: "discount_id")]
      getter discount_id : JSON::Any

      # List of meters associated with the subscription.
      @[JSON::Field(key: "meters")]
      getter meters : Array(CustomerStateSubscriptionMeter)
    end
  end
end
