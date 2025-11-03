# MetricsIntervalLimit
#
# Date interval limit to get metrics for a given interval.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a MetricsIntervalLimit
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct MetricsIntervalLimit
      include JSON::Serializable
      # Maximum number of days for this interval.
      @[JSON::Field(key: "max_days")]
      getter max_days : Int64
    end
  end
end
