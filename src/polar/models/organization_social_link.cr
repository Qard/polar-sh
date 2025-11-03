# OrganizationSocialLink
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a OrganizationSocialLink
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct OrganizationSocialLink
      include JSON::Serializable
      # The social platform of the URL
      @[JSON::Field(key: "platform")]
      getter platform : OrganizationSocialPlatforms

      # The URL to the organization profile
      @[JSON::Field(key: "url")]
      getter url : String
    end
  end
end
