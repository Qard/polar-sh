# SystemEvent
#
# System event structure for Polar.sh events.
#
# System events are created by Polar for various actions in the platform.
# All system events share this common structure with event-specific metadata.
#
# ## Usage
#
# ```
# # Parse a system event
# event = Polar::SystemEvent.from_json(json)
# puts "Event ID: #{event.id}"
# puts "Event name: #{event.name}"
# puts "Metadata: #{event.metadata}"
# ```
#
# Auto-generated from OpenAPI spec

module Polar
  module Models
    # System event
    struct SystemEvent
      include JSON::Serializable

      # The ID of the object
      @[JSON::Field(key: "id")]
      getter id : String

      # The timestamp of the event
      @[JSON::Field(key: "timestamp")]
      getter timestamp : Time

      # The ID of the organization owning the event
      @[JSON::Field(key: "organization_id")]
      getter organization_id : String

      # ID of the customer in your Polar organization associated with the event
      @[JSON::Field(key: "customer_id")]
      getter customer_id : JSON::Any

      # The customer associated with the event
      @[JSON::Field(key: "customer")]
      getter customer : JSON::Any

      # ID of the customer in your system associated with the event
      @[JSON::Field(key: "external_customer_id")]
      getter external_customer_id : JSON::Any

      # The source of the event (system or user)
      @[JSON::Field(key: "source")]
      getter source : String

      # The name of the event
      @[JSON::Field(key: "name")]
      getter name : String

      # Event-specific metadata
      @[JSON::Field(key: "metadata")]
      getter metadata : JSON::Any
    end
  end
end
