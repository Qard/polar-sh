# OrganizationNotificationSettings
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a OrganizationNotificationSettings
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct OrganizationNotificationSettings
      include JSON::Serializable
      @[JSON::Field(key: "new_order")]
      getter new_order : Bool

      @[JSON::Field(key: "new_subscription")]
      getter new_subscription : Bool
    end
  end
end
