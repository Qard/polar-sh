# OrganizationCustomerEmailSettings
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a OrganizationCustomerEmailSettings
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct OrganizationCustomerEmailSettings
      include JSON::Serializable
      @[JSON::Field(key: "order_confirmation")]
      getter order_confirmation : Bool

      @[JSON::Field(key: "subscription_cancellation")]
      getter subscription_cancellation : Bool

      @[JSON::Field(key: "subscription_confirmation")]
      getter subscription_confirmation : Bool

      @[JSON::Field(key: "subscription_cycled")]
      getter subscription_cycled : Bool

      @[JSON::Field(key: "subscription_past_due")]
      getter subscription_past_due : Bool

      @[JSON::Field(key: "subscription_revoked")]
      getter subscription_revoked : Bool

      @[JSON::Field(key: "subscription_uncanceled")]
      getter subscription_uncanceled : Bool

      @[JSON::Field(key: "subscription_updated")]
      getter subscription_updated : Bool
    end
  end
end
