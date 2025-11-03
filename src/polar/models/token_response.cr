# TokenResponse
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a TokenResponse
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct TokenResponse
      include JSON::Serializable
      @[JSON::Field(key: "access_token")]
      getter access_token : String

      @[JSON::Field(key: "token_type")]
      getter token_type : String

      @[JSON::Field(key: "expires_in")]
      getter expires_in : Int64

      @[JSON::Field(key: "refresh_token")]
      getter refresh_token : JSON::Any

      @[JSON::Field(key: "scope")]
      getter scope : String

      @[JSON::Field(key: "id_token")]
      getter id_token : String
    end
  end
end
