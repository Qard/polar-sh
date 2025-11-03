# RevokeTokenRequest
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a RevokeTokenRequest
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct RevokeTokenRequest
      include JSON::Serializable
      @[JSON::Field(key: "token")]
      getter token : String

      @[JSON::Field(key: "token_type_hint")]
      getter token_type_hint : JSON::Any?

      @[JSON::Field(key: "client_id")]
      getter client_id : String

      @[JSON::Field(key: "client_secret")]
      getter client_secret : String
    end
  end
end
