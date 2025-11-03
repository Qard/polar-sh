# MetricsLimits
#
# Date limits to get metrics.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a MetricsLimits
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct MetricsLimits
      include JSON::Serializable
      # Minimum date to get metrics.
      @[JSON::Field(key: "min_date")]
      getter min_date : Time

      # Limits for each interval.
      @[JSON::Field(key: "intervals")]
      getter intervals : MetricsIntervalsLimits
    end
  end
end
