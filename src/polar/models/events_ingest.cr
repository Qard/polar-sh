# EventsIngest
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a EventsIngest
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct EventsIngest
      include JSON::Serializable
      # List of events to ingest.
      @[JSON::Field(key: "events")]
      getter events : Array(JSON::Any)
    end
  end
end
