# UserInfoUser
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a UserInfoUser
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct UserInfoUser
      include JSON::Serializable
      @[JSON::Field(key: "sub")]
      getter sub : String

      @[JSON::Field(key: "name")]
      getter name : JSON::Any?

      @[JSON::Field(key: "email")]
      getter email : JSON::Any?

      @[JSON::Field(key: "email_verified")]
      getter email_verified : JSON::Any?
    end
  end
end
