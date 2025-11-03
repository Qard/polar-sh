# WebhookEndpoint
#
# A webhook endpoint.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a WebhookEndpoint
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct WebhookEndpoint
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

      # The URL where the webhook events will be sent.
      @[JSON::Field(key: "url")]
      getter url : String

      # The format of the webhook payload.
      @[JSON::Field(key: "format")]
      getter format : WebhookFormat

      # The secret used to sign the webhook events.
      @[JSON::Field(key: "secret")]
      getter secret : String

      # The organization ID associated with the webhook endpoint.
      @[JSON::Field(key: "organization_id")]
      getter organization_id : String

      # The events that will trigger the webhook.
      @[JSON::Field(key: "events")]
      getter events : Array(WebhookEventType)

      # Whether the webhook endpoint is enabled and will receive events.
      @[JSON::Field(key: "enabled")]
      getter enabled : Bool
    end
  end
end
