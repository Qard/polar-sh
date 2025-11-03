# BenefitGrant
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a BenefitGrant
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct BenefitGrant
      include JSON::Serializable
      # Creation timestamp of the object.
      @[JSON::Field(key: "created_at")]
      getter created_at : Time

      # Last modification timestamp of the object.
      @[JSON::Field(key: "modified_at")]
      getter modified_at : JSON::Any

      # The ID of the grant.
      @[JSON::Field(key: "id")]
      getter id : String

      # The timestamp when the benefit was granted. If None, the benefit is not granted.
      @[JSON::Field(key: "granted_at")]
      getter granted_at : JSON::Any?

      # Whether the benefit is granted.
      @[JSON::Field(key: "is_granted")]
      getter is_granted : Bool

      # The timestamp when the benefit was revoked. If None, the benefit is not revoked.
      @[JSON::Field(key: "revoked_at")]
      getter revoked_at : JSON::Any?

      # Whether the benefit is revoked.
      @[JSON::Field(key: "is_revoked")]
      getter is_revoked : Bool

      # The ID of the subscription that granted this benefit.
      @[JSON::Field(key: "subscription_id")]
      getter subscription_id : JSON::Any

      # The ID of the order that granted this benefit.
      @[JSON::Field(key: "order_id")]
      getter order_id : JSON::Any

      # The ID of the customer concerned by this grant.
      @[JSON::Field(key: "customer_id")]
      getter customer_id : String

      # The ID of the benefit concerned by this grant.
      @[JSON::Field(key: "benefit_id")]
      getter benefit_id : String

      # The error information if the benefit grant failed with an unrecoverable error.
      @[JSON::Field(key: "error")]
      getter error : JSON::Any?

      @[JSON::Field(key: "customer")]
      getter customer : Customer

      @[JSON::Field(key: "benefit")]
      getter benefit : Benefit

      @[JSON::Field(key: "properties")]
      getter properties : JSON::Any
    end
  end
end
