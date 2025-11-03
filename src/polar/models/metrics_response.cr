# MetricsResponse
#
# Metrics response schema.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a MetricsResponse
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct MetricsResponse
      include JSON::Serializable
      # List of data for each timestamp.
      @[JSON::Field(key: "periods")]
      getter periods : Array(MetricPeriod)

      # Totals for the whole selected period.
      @[JSON::Field(key: "totals")]
      getter totals : MetricsTotals

      # Information about the returned metrics.
      @[JSON::Field(key: "metrics")]
      getter metrics : Metrics
    end
  end
end
