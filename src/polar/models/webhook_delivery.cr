# WebhookDelivery
#
# A webhook delivery for a webhook event.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a WebhookDelivery
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct WebhookDelivery
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

      # Whether the delivery was successful.
      @[JSON::Field(key: "succeeded")]
      getter succeeded : Bool

      # The HTTP code returned by the URL. null if the endpoint was unreachable.
      @[JSON::Field(key: "http_code")]
      getter http_code : JSON::Any

      # The response body returned by the URL, or the error message if the endpoint was unreachable.
      @[JSON::Field(key: "response")]
      getter response : JSON::Any

      # The webhook event sent by this delivery.
      @[JSON::Field(key: "webhook_event")]
      getter webhook_event : WebhookEvent
    end
  end
end
