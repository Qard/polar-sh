# WebhookEndpointUpdate
#
# Schema to update a webhook endpoint.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a WebhookEndpointUpdate
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct WebhookEndpointUpdate
      include JSON::Serializable
      @[JSON::Field(key: "url")]
      getter url : JSON::Any?

      @[JSON::Field(key: "secret")]
      getter secret : JSON::Any?

      @[JSON::Field(key: "format")]
      getter format : JSON::Any?

      @[JSON::Field(key: "events")]
      getter events : JSON::Any?

      # Whether the webhook endpoint is enabled.
      @[JSON::Field(key: "enabled")]
      getter enabled : JSON::Any?
    end
  end
end
