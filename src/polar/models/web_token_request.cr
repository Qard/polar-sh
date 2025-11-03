# WebTokenRequest
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a WebTokenRequest
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct WebTokenRequest
      include JSON::Serializable
      @[JSON::Field(key: "grant_type")]
      getter grant_type : String

      @[JSON::Field(key: "client_id")]
      getter client_id : String

      @[JSON::Field(key: "client_secret")]
      getter client_secret : String

      @[JSON::Field(key: "session_token")]
      getter session_token : String

      @[JSON::Field(key: "sub_type")]
      getter sub_type : String?

      @[JSON::Field(key: "sub")]
      getter sub : JSON::Any?

      @[JSON::Field(key: "scope")]
      getter scope : JSON::Any?
    end
  end
end
