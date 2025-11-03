# Metric
#
# Information about a metric.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a Metric
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct Metric
      include JSON::Serializable
      # Unique identifier for the metric.
      @[JSON::Field(key: "slug")]
      getter slug : String

      # Human-readable name for the metric.
      @[JSON::Field(key: "display_name")]
      getter display_name : String

      # Type of the metric, useful to know the unit or format of the value.
      @[JSON::Field(key: "type")]
      getter type : MetricType
    end
  end
end
