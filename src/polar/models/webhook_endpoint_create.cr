# WebhookEndpointCreate
#
# Schema to create a webhook endpoint.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a WebhookEndpointCreate
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct WebhookEndpointCreate
      include JSON::Serializable
      # The URL where the webhook events will be sent.
      @[JSON::Field(key: "url")]
      getter url : String

      @[JSON::Field(key: "secret")]
      getter secret : JSON::Any?

      # The format of the webhook payload.
      @[JSON::Field(key: "format")]
      getter format : WebhookFormat

      # The events that will trigger the webhook.
      @[JSON::Field(key: "events")]
      getter events : Array(WebhookEventType)

      # The organization ID associated with the webhook endpoint. Required unless you use an organization token.
      @[JSON::Field(key: "organization_id")]
      getter organization_id : JSON::Any?
    end
  end
end
