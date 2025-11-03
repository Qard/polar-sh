# UserInfoOrganization
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a UserInfoOrganization
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct UserInfoOrganization
      include JSON::Serializable
      @[JSON::Field(key: "sub")]
      getter sub : String

      @[JSON::Field(key: "name")]
      getter name : JSON::Any?
    end
  end
end
