# LicenseKeyActivationRead
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a LicenseKeyActivationRead
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct LicenseKeyActivationRead
      include JSON::Serializable
      @[JSON::Field(key: "id")]
      getter id : String

      @[JSON::Field(key: "license_key_id")]
      getter license_key_id : String

      @[JSON::Field(key: "label")]
      getter label : String

      @[JSON::Field(key: "meta")]
      getter meta : Hash(String, JSON::Any)

      @[JSON::Field(key: "created_at")]
      getter created_at : Time

      @[JSON::Field(key: "modified_at")]
      getter modified_at : JSON::Any

      @[JSON::Field(key: "license_key")]
      getter license_key : LicenseKeyRead
    end
  end
end
