# BenefitGrantWebhook(B, P)
#
# Generic benefit grant webhook structure for Polar.sh webhook events.
#
# Benefit grants represent the assignment of a benefit to a customer.
# This generic type allows different benefit types and their associated
# properties to be represented with type safety.
#
# ## Usage
#
# ```
# # Parse a custom benefit grant webhook
# grant = Polar::BenefitGrantWebhook(Polar::BenefitCustom, Polar::BenefitGrantCustomProperties).from_json(json)
# puts "Grant ID: #{grant.id}"
# puts "Benefit: #{grant.benefit}"
# ```
#
# Auto-generated from OpenAPI spec

module Polar
  # Generic benefit grant webhook payload
  #
  # @param B The type of benefit
  # @param P The type of grant properties
  struct BenefitGrantWebhook(B, P)
    include JSON::Serializable

    # Creation timestamp of the object
    @[JSON::Field(key: "created_at")]
    getter created_at : Time

    # Last modification timestamp of the object
    @[JSON::Field(key: "modified_at")]
    getter modified_at : JSON::Any

    # The ID of the grant
    @[JSON::Field(key: "id")]
    getter id : String

    # The timestamp when the benefit was granted
    @[JSON::Field(key: "granted_at")]
    getter granted_at : JSON::Any?

    # Whether the benefit is granted
    @[JSON::Field(key: "is_granted")]
    getter is_granted : Bool

    # The timestamp when the benefit was revoked
    @[JSON::Field(key: "revoked_at")]
    getter revoked_at : JSON::Any?

    # Whether the benefit is revoked
    @[JSON::Field(key: "is_revoked")]
    getter is_revoked : Bool

    # The ID of the subscription that granted this benefit
    @[JSON::Field(key: "subscription_id")]
    getter subscription_id : JSON::Any

    # The ID of the order that granted this benefit
    @[JSON::Field(key: "order_id")]
    getter order_id : JSON::Any

    # The ID of the customer concerned by this grant
    @[JSON::Field(key: "customer_id")]
    getter customer_id : String

    # The ID of the benefit concerned by this grant
    @[JSON::Field(key: "benefit_id")]
    getter benefit_id : String

    # Error information if the benefit grant failed
    @[JSON::Field(key: "error")]
    getter error : JSON::Any?

    # The customer receiving the benefit
    @[JSON::Field(key: "customer")]
    getter customer : Models::Customer

    # The benefit being granted
    @[JSON::Field(key: "benefit")]
    getter benefit : B

    # Type-specific grant properties
    @[JSON::Field(key: "properties")]
    getter properties : P

    # Previous properties (for update events)
    @[JSON::Field(key: "previous_properties")]
    getter previous_properties : JSON::Any?
  end
end
