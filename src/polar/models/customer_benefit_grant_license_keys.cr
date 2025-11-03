# CustomerBenefitGrantLicenseKeys
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomerBenefitGrantLicenseKeys
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomerBenefitGrantLicenseKeys
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

      @[JSON::Field(key: "granted_at")]
      getter granted_at : JSON::Any

      @[JSON::Field(key: "revoked_at")]
      getter revoked_at : JSON::Any

      @[JSON::Field(key: "customer_id")]
      getter customer_id : String

      @[JSON::Field(key: "benefit_id")]
      getter benefit_id : String

      @[JSON::Field(key: "subscription_id")]
      getter subscription_id : JSON::Any

      @[JSON::Field(key: "order_id")]
      getter order_id : JSON::Any

      @[JSON::Field(key: "is_granted")]
      getter is_granted : Bool

      @[JSON::Field(key: "is_revoked")]
      getter is_revoked : Bool

      @[JSON::Field(key: "customer")]
      getter customer : CustomerPortalCustomer

      @[JSON::Field(key: "benefit")]
      getter benefit : BenefitLicenseKeysSubscriber

      @[JSON::Field(key: "properties")]
      getter properties : BenefitGrantLicenseKeysProperties
    end
  end
end
