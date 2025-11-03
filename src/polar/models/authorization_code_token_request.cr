# AuthorizationCodeTokenRequest
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a AuthorizationCodeTokenRequest
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct AuthorizationCodeTokenRequest
      include JSON::Serializable
      @[JSON::Field(key: "grant_type")]
      getter grant_type : String

      @[JSON::Field(key: "client_id")]
      getter client_id : String

      @[JSON::Field(key: "client_secret")]
      getter client_secret : String

      @[JSON::Field(key: "code")]
      getter code : String

      @[JSON::Field(key: "redirect_uri")]
      getter redirect_uri : String
    end
  end
end
