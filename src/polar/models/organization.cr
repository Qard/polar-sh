# Organization
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a Organization
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct Organization
      include JSON::Serializable
      # Creation timestamp of the object.
      @[JSON::Field(key: "created_at")]
      getter created_at : Time

      # Last modification timestamp of the object.
      @[JSON::Field(key: "modified_at")]
      getter modified_at : JSON::Any

      # The organization ID.
      @[JSON::Field(key: "id")]
      getter id : String

      # Organization name shown in checkout, customer portal, emails etc.
      @[JSON::Field(key: "name")]
      getter name : String

      # Unique organization slug in checkout, customer portal and credit card statements.
      @[JSON::Field(key: "slug")]
      getter slug : String

      # Avatar URL shown in checkout, customer portal, emails etc.
      @[JSON::Field(key: "avatar_url")]
      getter avatar_url : JSON::Any

      # Public support email.
      @[JSON::Field(key: "email")]
      getter email : JSON::Any

      # Official website of the organization.
      @[JSON::Field(key: "website")]
      getter website : JSON::Any

      # Links to social profiles.
      @[JSON::Field(key: "socials")]
      getter socials : Array(OrganizationSocialLink)

      # Current organization status
      @[JSON::Field(key: "status")]
      getter status : OrganizationStatus

      # When the business details were submitted.
      @[JSON::Field(key: "details_submitted_at")]
      getter details_submitted_at : JSON::Any

      # Organization feature settings
      @[JSON::Field(key: "feature_settings")]
      getter feature_settings : JSON::Any

      # Settings related to subscriptions management
      @[JSON::Field(key: "subscription_settings")]
      getter subscription_settings : OrganizationSubscriptionSettings

      # Settings related to notifications
      @[JSON::Field(key: "notification_settings")]
      getter notification_settings : OrganizationNotificationSettings

      # Settings related to customer emails
      @[JSON::Field(key: "customer_email_settings")]
      getter customer_email_settings : OrganizationCustomerEmailSettings
    end
  end
end
