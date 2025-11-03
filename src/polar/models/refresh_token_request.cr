# RefreshTokenRequest
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a RefreshTokenRequest
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct RefreshTokenRequest
      include JSON::Serializable
      @[JSON::Field(key: "grant_type")]
      getter grant_type : String

      @[JSON::Field(key: "client_id")]
      getter client_id : String

      @[JSON::Field(key: "client_secret")]
      getter client_secret : String

      @[JSON::Field(key: "refresh_token")]
      getter refresh_token : String
    end
  end
end
