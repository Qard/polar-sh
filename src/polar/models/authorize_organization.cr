# AuthorizeOrganization
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a AuthorizeOrganization
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct AuthorizeOrganization
      include JSON::Serializable
      @[JSON::Field(key: "id")]
      getter id : String

      @[JSON::Field(key: "slug")]
      getter slug : String

      @[JSON::Field(key: "avatar_url")]
      getter avatar_url : JSON::Any
    end
  end
end
