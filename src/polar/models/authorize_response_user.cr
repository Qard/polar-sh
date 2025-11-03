# AuthorizeResponseUser
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a AuthorizeResponseUser
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct AuthorizeResponseUser
      include JSON::Serializable
      @[JSON::Field(key: "client")]
      getter client : OAuth2ClientPublic

      @[JSON::Field(key: "sub_type")]
      getter sub_type : String

      @[JSON::Field(key: "sub")]
      getter sub : JSON::Any

      @[JSON::Field(key: "scopes")]
      getter scopes : Array(Scope)
    end
  end
end
