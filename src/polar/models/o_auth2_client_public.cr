# OAuth2ClientPublic
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a OAuth2ClientPublic
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct OAuth2ClientPublic
      include JSON::Serializable
      # Creation timestamp of the object.
      @[JSON::Field(key: "created_at")]
      getter created_at : Time

      # Last modification timestamp of the object.
      @[JSON::Field(key: "modified_at")]
      getter modified_at : JSON::Any

      @[JSON::Field(key: "client_id")]
      getter client_id : String

      @[JSON::Field(key: "client_name")]
      getter client_name : JSON::Any

      @[JSON::Field(key: "client_uri")]
      getter client_uri : JSON::Any

      @[JSON::Field(key: "logo_uri")]
      getter logo_uri : JSON::Any

      @[JSON::Field(key: "tos_uri")]
      getter tos_uri : JSON::Any

      @[JSON::Field(key: "policy_uri")]
      getter policy_uri : JSON::Any
    end
  end
end
