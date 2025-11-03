# UserEvent
#
# An event you created through the ingestion API.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a UserEvent
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct UserEvent
      include JSON::Serializable
      # The ID of the object.
      @[JSON::Field(key: "id")]
      getter id : String

      # The timestamp of the event.
      @[JSON::Field(key: "timestamp")]
      getter timestamp : Time

      # The ID of the organization owning the event.
      @[JSON::Field(key: "organization_id")]
      getter organization_id : String

      # ID of the customer in your Polar organization associated with the event.
      @[JSON::Field(key: "customer_id")]
      getter customer_id : JSON::Any

      # The customer associated with the event.
      @[JSON::Field(key: "customer")]
      getter customer : JSON::Any

      # ID of the customer in your system associated with the event.
      @[JSON::Field(key: "external_customer_id")]
      getter external_customer_id : JSON::Any

      # The name of the event.
      @[JSON::Field(key: "name")]
      getter name : String

      # The source of the event. system events are created by Polar. user events are the one you create through our ingestion API.
      @[JSON::Field(key: "source")]
      getter source : String

      @[JSON::Field(key: "metadata")]
      getter metadata : EventMetadataOutput
    end
  end
end
