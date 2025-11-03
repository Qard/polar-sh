# OAuth2ClientConfiguration
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a OAuth2ClientConfiguration
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct OAuth2ClientConfiguration
      include JSON::Serializable
      @[JSON::Field(key: "redirect_uris")]
      getter redirect_uris : Array(String)

      @[JSON::Field(key: "token_endpoint_auth_method")]
      getter token_endpoint_auth_method : String?

      @[JSON::Field(key: "grant_types")]
      getter grant_types : Array(String)?

      @[JSON::Field(key: "response_types")]
      getter response_types : Array(String)?

      @[JSON::Field(key: "scope")]
      getter scope : String?

      @[JSON::Field(key: "client_name")]
      getter client_name : String

      @[JSON::Field(key: "client_uri")]
      getter client_uri : JSON::Any?

      @[JSON::Field(key: "logo_uri")]
      getter logo_uri : JSON::Any?

      @[JSON::Field(key: "tos_uri")]
      getter tos_uri : JSON::Any?

      @[JSON::Field(key: "policy_uri")]
      getter policy_uri : JSON::Any?

      @[JSON::Field(key: "default_sub_type")]
      getter default_sub_type : SubType?
    end
  end
end
