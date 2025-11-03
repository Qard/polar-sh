# Metrics
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a Metrics
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct Metrics
      include JSON::Serializable
      @[JSON::Field(key: "orders")]
      getter orders : Metric

      @[JSON::Field(key: "revenue")]
      getter revenue : Metric

      @[JSON::Field(key: "net_revenue")]
      getter net_revenue : Metric

      @[JSON::Field(key: "cumulative_revenue")]
      getter cumulative_revenue : Metric

      @[JSON::Field(key: "net_cumulative_revenue")]
      getter net_cumulative_revenue : Metric

      @[JSON::Field(key: "costs")]
      getter costs : Metric

      @[JSON::Field(key: "cumulative_costs")]
      getter cumulative_costs : Metric

      @[JSON::Field(key: "average_order_value")]
      getter average_order_value : Metric

      @[JSON::Field(key: "net_average_order_value")]
      getter net_average_order_value : Metric

      @[JSON::Field(key: "average_revenue_per_user")]
      getter average_revenue_per_user : Metric

      @[JSON::Field(key: "cost_per_user")]
      getter cost_per_user : Metric

      @[JSON::Field(key: "active_user_by_event")]
      getter active_user_by_event : Metric

      @[JSON::Field(key: "one_time_products")]
      getter one_time_products : Metric

      @[JSON::Field(key: "one_time_products_revenue")]
      getter one_time_products_revenue : Metric

      @[JSON::Field(key: "one_time_products_net_revenue")]
      getter one_time_products_net_revenue : Metric

      @[JSON::Field(key: "new_subscriptions")]
      getter new_subscriptions : Metric

      @[JSON::Field(key: "new_subscriptions_revenue")]
      getter new_subscriptions_revenue : Metric

      @[JSON::Field(key: "new_subscriptions_net_revenue")]
      getter new_subscriptions_net_revenue : Metric

      @[JSON::Field(key: "renewed_subscriptions")]
      getter renewed_subscriptions : Metric

      @[JSON::Field(key: "renewed_subscriptions_revenue")]
      getter renewed_subscriptions_revenue : Metric

      @[JSON::Field(key: "renewed_subscriptions_net_revenue")]
      getter renewed_subscriptions_net_revenue : Metric

      @[JSON::Field(key: "active_subscriptions")]
      getter active_subscriptions : Metric

      @[JSON::Field(key: "monthly_recurring_revenue")]
      getter monthly_recurring_revenue : Metric

      @[JSON::Field(key: "committed_monthly_recurring_revenue")]
      getter committed_monthly_recurring_revenue : Metric

      @[JSON::Field(key: "checkouts")]
      getter checkouts : Metric

      @[JSON::Field(key: "succeeded_checkouts")]
      getter succeeded_checkouts : Metric

      @[JSON::Field(key: "checkouts_conversion")]
      getter checkouts_conversion : Metric

      @[JSON::Field(key: "canceled_subscriptions")]
      getter canceled_subscriptions : Metric

      @[JSON::Field(key: "canceled_subscriptions_customer_service")]
      getter canceled_subscriptions_customer_service : Metric

      @[JSON::Field(key: "canceled_subscriptions_low_quality")]
      getter canceled_subscriptions_low_quality : Metric

      @[JSON::Field(key: "canceled_subscriptions_missing_features")]
      getter canceled_subscriptions_missing_features : Metric

      @[JSON::Field(key: "canceled_subscriptions_switched_service")]
      getter canceled_subscriptions_switched_service : Metric

      @[JSON::Field(key: "canceled_subscriptions_too_complex")]
      getter canceled_subscriptions_too_complex : Metric

      @[JSON::Field(key: "canceled_subscriptions_too_expensive")]
      getter canceled_subscriptions_too_expensive : Metric

      @[JSON::Field(key: "canceled_subscriptions_unused")]
      getter canceled_subscriptions_unused : Metric

      @[JSON::Field(key: "canceled_subscriptions_other")]
      getter canceled_subscriptions_other : Metric

      @[JSON::Field(key: "churn_rate")]
      getter churn_rate : Metric

      @[JSON::Field(key: "gross_margin")]
      getter gross_margin : Metric

      @[JSON::Field(key: "gross_margin_percentage")]
      getter gross_margin_percentage : Metric

      @[JSON::Field(key: "cashflow")]
      getter cashflow : Metric
    end
  end
end
