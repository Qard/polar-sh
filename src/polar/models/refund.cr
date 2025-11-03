# Refund
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a Refund
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct Refund
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

      @[JSON::Field(key: "metadata")]
      getter metadata : Hash(String, JSON::Any)

      @[JSON::Field(key: "status")]
      getter status : RefundStatus

      @[JSON::Field(key: "reason")]
      getter reason : RefundReason

      @[JSON::Field(key: "amount")]
      getter amount : Int64

      @[JSON::Field(key: "tax_amount")]
      getter tax_amount : Int64

      @[JSON::Field(key: "currency")]
      getter currency : String

      @[JSON::Field(key: "organization_id")]
      getter organization_id : String

      @[JSON::Field(key: "order_id")]
      getter order_id : String

      @[JSON::Field(key: "subscription_id")]
      getter subscription_id : JSON::Any

      @[JSON::Field(key: "customer_id")]
      getter customer_id : String

      @[JSON::Field(key: "revoke_benefits")]
      getter revoke_benefits : Bool
    end
  end
end
