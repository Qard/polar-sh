# OrganizationSubscriptionSettings
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a OrganizationSubscriptionSettings
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct OrganizationSubscriptionSettings
      include JSON::Serializable
      @[JSON::Field(key: "allow_multiple_subscriptions")]
      getter allow_multiple_subscriptions : Bool

      @[JSON::Field(key: "allow_customer_updates")]
      getter allow_customer_updates : Bool

      @[JSON::Field(key: "proration_behavior")]
      getter proration_behavior : SubscriptionProrationBehavior

      @[JSON::Field(key: "benefit_revocation_grace_period")]
      getter benefit_revocation_grace_period : Int64
    end
  end
end
