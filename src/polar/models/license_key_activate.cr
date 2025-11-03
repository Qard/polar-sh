# LicenseKeyActivate
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a LicenseKeyActivate
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct LicenseKeyActivate
      include JSON::Serializable
      @[JSON::Field(key: "key")]
      getter key : String

      @[JSON::Field(key: "organization_id")]
      getter organization_id : String

      @[JSON::Field(key: "label")]
      getter label : String

      # Key-value object allowing you to set conditions that must match when validating the license key.
      #
      # The key must be a string with a maximum length of 40 characters.
      # The value must be either:
      #
      #  A string with a maximum length of 500 characters
      #  An integer
      #  A floating-point number
      #  A boolean
      #
      # You can store up to 50 key-value pairs.
      @[JSON::Field(key: "conditions")]
      getter conditions : Hash(String, JSON::Any)?

      # Key-value object allowing you to store additional information about the activation
      #
      # The key must be a string with a maximum length of 40 characters.
      # The value must be either:
      #
      #  A string with a maximum length of 500 characters
      #  An integer
      #  A floating-point number
      #  A boolean
      #
      # You can store up to 50 key-value pairs.
      @[JSON::Field(key: "meta")]
      getter meta : Hash(String, JSON::Any)?
    end
  end
end
