# WebhookEvent
#
# A webhook event.
#
# An event represent something that happened in the system
# that should be sent to the webhook endpoint.
#
# It can be delivered multiple times until it's marked as succeeded,
# each one creating a new delivery.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a WebhookEvent
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct WebhookEvent
      include JSON::Serializable
      # Creation timestamp of the object.
      @[JSON::Field(key: "created_at")]
      getter created_at : Time

      # Last modification timestamp of the object.
      @[JSON::Field(key: "modified_at")]
      getter modified_at : JSON::Any

      # The ID of the object.
      @[JSON::Field(key: "id")]
      getter id : String

      # Last HTTP code returned by the URL. null if no delviery has been attempted or if the endpoint was unreachable.
      @[JSON::Field(key: "last_http_code")]
      getter last_http_code : JSON::Any?

      # Whether this event was successfully delivered. null if no delivery has been attempted.
      @[JSON::Field(key: "succeeded")]
      getter succeeded : JSON::Any?

      # The payload of the webhook event.
      @[JSON::Field(key: "payload")]
      getter payload : JSON::Any

      # The type of the webhook event.
      @[JSON::Field(key: "type")]
      getter type : WebhookEventType

      # Whether this event is archived. Archived events can't be redelivered, and the payload is not accessible anymore.
      @[JSON::Field(key: "is_archived")]
      getter is_archived : Bool
    end
  end
end
