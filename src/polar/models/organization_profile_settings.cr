# OrganizationProfileSettings
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a OrganizationProfileSettings
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct OrganizationProfileSettings
      include JSON::Serializable
      # If this organization has a profile enabled
      @[JSON::Field(key: "enabled")]
      getter enabled : JSON::Any?

      # A description of the organization
      @[JSON::Field(key: "description")]
      getter description : JSON::Any?

      # A list of featured projects
      @[JSON::Field(key: "featured_projects")]
      getter featured_projects : JSON::Any?

      # A list of featured organizations
      @[JSON::Field(key: "featured_organizations")]
      getter featured_organizations : JSON::Any?

      # A list of links associated with the organization
      @[JSON::Field(key: "links")]
      getter links : JSON::Any?

      # Subscription promotion settings
      @[JSON::Field(key: "subscribe")]
      getter subscribe : JSON::Any?

      # Accent color for the organization
      @[JSON::Field(key: "accent_color")]
      getter accent_color : JSON::Any?
    end
  end
end
