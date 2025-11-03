# IntrospectTokenResponse
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a IntrospectTokenResponse
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct IntrospectTokenResponse
      include JSON::Serializable
      @[JSON::Field(key: "active")]
      getter active : Bool

      @[JSON::Field(key: "client_id")]
      getter client_id : String

      @[JSON::Field(key: "token_type")]
      getter token_type : String

      @[JSON::Field(key: "scope")]
      getter scope : String

      @[JSON::Field(key: "sub_type")]
      getter sub_type : SubType

      @[JSON::Field(key: "sub")]
      getter sub : String

      @[JSON::Field(key: "aud")]
      getter aud : String

      @[JSON::Field(key: "iss")]
      getter iss : String

      @[JSON::Field(key: "exp")]
      getter exp : Int64

      @[JSON::Field(key: "iat")]
      getter iat : Int64
    end
  end
end
