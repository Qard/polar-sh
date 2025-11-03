# MetricsTotals
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a MetricsTotals
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct MetricsTotals
      include JSON::Serializable
      @[JSON::Field(key: "orders")]
      getter orders : JSON::Any

      @[JSON::Field(key: "revenue")]
      getter revenue : JSON::Any

      @[JSON::Field(key: "net_revenue")]
      getter net_revenue : JSON::Any

      @[JSON::Field(key: "cumulative_revenue")]
      getter cumulative_revenue : JSON::Any

      @[JSON::Field(key: "net_cumulative_revenue")]
      getter net_cumulative_revenue : JSON::Any

      @[JSON::Field(key: "costs")]
      getter costs : JSON::Any

      @[JSON::Field(key: "cumulative_costs")]
      getter cumulative_costs : JSON::Any

      @[JSON::Field(key: "average_order_value")]
      getter average_order_value : JSON::Any

      @[JSON::Field(key: "net_average_order_value")]
      getter net_average_order_value : JSON::Any

      @[JSON::Field(key: "average_revenue_per_user")]
      getter average_revenue_per_user : JSON::Any

      @[JSON::Field(key: "cost_per_user")]
      getter cost_per_user : JSON::Any

      @[JSON::Field(key: "active_user_by_event")]
      getter active_user_by_event : JSON::Any

      @[JSON::Field(key: "one_time_products")]
      getter one_time_products : JSON::Any

      @[JSON::Field(key: "one_time_products_revenue")]
      getter one_time_products_revenue : JSON::Any

      @[JSON::Field(key: "one_time_products_net_revenue")]
      getter one_time_products_net_revenue : JSON::Any

      @[JSON::Field(key: "new_subscriptions")]
      getter new_subscriptions : JSON::Any

      @[JSON::Field(key: "new_subscriptions_revenue")]
      getter new_subscriptions_revenue : JSON::Any

      @[JSON::Field(key: "new_subscriptions_net_revenue")]
      getter new_subscriptions_net_revenue : JSON::Any

      @[JSON::Field(key: "renewed_subscriptions")]
      getter renewed_subscriptions : JSON::Any

      @[JSON::Field(key: "renewed_subscriptions_revenue")]
      getter renewed_subscriptions_revenue : JSON::Any

      @[JSON::Field(key: "renewed_subscriptions_net_revenue")]
      getter renewed_subscriptions_net_revenue : JSON::Any

      @[JSON::Field(key: "active_subscriptions")]
      getter active_subscriptions : JSON::Any

      @[JSON::Field(key: "monthly_recurring_revenue")]
      getter monthly_recurring_revenue : JSON::Any

      @[JSON::Field(key: "committed_monthly_recurring_revenue")]
      getter committed_monthly_recurring_revenue : JSON::Any

      @[JSON::Field(key: "checkouts")]
      getter checkouts : JSON::Any

      @[JSON::Field(key: "succeeded_checkouts")]
      getter succeeded_checkouts : JSON::Any

      @[JSON::Field(key: "checkouts_conversion")]
      getter checkouts_conversion : JSON::Any

      @[JSON::Field(key: "canceled_subscriptions")]
      getter canceled_subscriptions : JSON::Any

      @[JSON::Field(key: "canceled_subscriptions_customer_service")]
      getter canceled_subscriptions_customer_service : JSON::Any

      @[JSON::Field(key: "canceled_subscriptions_low_quality")]
      getter canceled_subscriptions_low_quality : JSON::Any

      @[JSON::Field(key: "canceled_subscriptions_missing_features")]
      getter canceled_subscriptions_missing_features : JSON::Any

      @[JSON::Field(key: "canceled_subscriptions_switched_service")]
      getter canceled_subscriptions_switched_service : JSON::Any

      @[JSON::Field(key: "canceled_subscriptions_too_complex")]
      getter canceled_subscriptions_too_complex : JSON::Any

      @[JSON::Field(key: "canceled_subscriptions_too_expensive")]
      getter canceled_subscriptions_too_expensive : JSON::Any

      @[JSON::Field(key: "canceled_subscriptions_unused")]
      getter canceled_subscriptions_unused : JSON::Any

      @[JSON::Field(key: "canceled_subscriptions_other")]
      getter canceled_subscriptions_other : JSON::Any

      @[JSON::Field(key: "churn_rate")]
      getter churn_rate : JSON::Any

      @[JSON::Field(key: "gross_margin")]
      getter gross_margin : JSON::Any

      @[JSON::Field(key: "gross_margin_percentage")]
      getter gross_margin_percentage : JSON::Any

      @[JSON::Field(key: "cashflow")]
      getter cashflow : JSON::Any
    end
  end
end
