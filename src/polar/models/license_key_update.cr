# LicenseKeyUpdate
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a LicenseKeyUpdate
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct LicenseKeyUpdate
      include JSON::Serializable
      @[JSON::Field(key: "status")]
      getter status : JSON::Any?

      @[JSON::Field(key: "usage")]
      getter usage : Int64?

      @[JSON::Field(key: "limit_activations")]
      getter limit_activations : JSON::Any?

      @[JSON::Field(key: "limit_usage")]
      getter limit_usage : JSON::Any?

      @[JSON::Field(key: "expires_at")]
      getter expires_at : JSON::Any?
    end
  end
end
