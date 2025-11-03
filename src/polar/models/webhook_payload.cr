# WebhookPayload(T)
#
# Generic webhook payload structure for Polar.sh webhook events.
#
# All webhook events share this common structure with a type identifier,
# timestamp, and typed data payload.
#
# ## Usage
#
# ```
# # Parse a webhook with organization data
# payload = Polar::WebhookPayload(Polar::Organization).from_json(json)
# puts "Event type: #{payload.type}"
# puts "Organization: #{payload.data.name}"
# ```
#
# Auto-generated from OpenAPI spec

module Polar
  # Generic webhook event payload
  #
  # @param T The type of data in the webhook payload
  struct WebhookPayload(T)
    include JSON::Serializable

    # The webhook event type identifier
    @[JSON::Field(key: "type")]
    getter type : String

    # When the webhook event occurred
    @[JSON::Field(key: "timestamp")]
    getter timestamp : Time

    # The event data payload
    @[JSON::Field(key: "data")]
    getter data : T
  end
end
