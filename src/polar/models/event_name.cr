# EventName
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a EventName
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct EventName
      include JSON::Serializable
      # The name of the event.
      @[JSON::Field(key: "name")]
      getter name : String

      # The source of the event. system events are created by Polar. user events are the one you create through our ingestion API.
      @[JSON::Field(key: "source")]
      getter source : EventSource

      # Number of times the event has occurred.
      @[JSON::Field(key: "occurrences")]
      getter occurrences : Int64

      # The first time the event occurred.
      @[JSON::Field(key: "first_seen")]
      getter first_seen : Time

      # The last time the event occurred.
      @[JSON::Field(key: "last_seen")]
      getter last_seen : Time
    end
  end
end
