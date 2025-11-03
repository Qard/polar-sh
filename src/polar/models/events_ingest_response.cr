# EventsIngestResponse
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a EventsIngestResponse
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct EventsIngestResponse
      include JSON::Serializable
      # Number of events inserted.
      @[JSON::Field(key: "inserted")]
      getter inserted : Int64
    end
  end
end
