# MetricsIntervalsLimits
#
# Date interval limits to get metrics for each interval.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a MetricsIntervalsLimits
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct MetricsIntervalsLimits
      include JSON::Serializable
      # Limits for the hour interval.
      @[JSON::Field(key: "hour")]
      getter hour : MetricsIntervalLimit

      # Limits for the day interval.
      @[JSON::Field(key: "day")]
      getter day : MetricsIntervalLimit

      # Limits for the week interval.
      @[JSON::Field(key: "week")]
      getter week : MetricsIntervalLimit

      # Limits for the month interval.
      @[JSON::Field(key: "month")]
      getter month : MetricsIntervalLimit

      # Limits for the year interval.
      @[JSON::Field(key: "year")]
      getter year : MetricsIntervalLimit
    end
  end
end
