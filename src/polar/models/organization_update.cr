# OrganizationUpdate
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a OrganizationUpdate
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct OrganizationUpdate
      include JSON::Serializable
      @[JSON::Field(key: "name")]
      getter name : JSON::Any?

      @[JSON::Field(key: "avatar_url")]
      getter avatar_url : JSON::Any?

      # Public support email.
      @[JSON::Field(key: "email")]
      getter email : JSON::Any?

      # Official website of the organization.
      @[JSON::Field(key: "website")]
      getter website : JSON::Any?

      # Links to social profiles.
      @[JSON::Field(key: "socials")]
      getter socials : JSON::Any?

      # Additional, private, business details Polar needs about active organizations for compliance (KYC).
      @[JSON::Field(key: "details")]
      getter details : JSON::Any?

      @[JSON::Field(key: "feature_settings")]
      getter feature_settings : JSON::Any?

      @[JSON::Field(key: "subscription_settings")]
      getter subscription_settings : JSON::Any?

      @[JSON::Field(key: "notification_settings")]
      getter notification_settings : JSON::Any?

      @[JSON::Field(key: "customer_email_settings")]
      getter customer_email_settings : JSON::Any?
    end
  end
end
