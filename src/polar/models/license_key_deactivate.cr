# LicenseKeyDeactivate
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a LicenseKeyDeactivate
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct LicenseKeyDeactivate
      include JSON::Serializable
      @[JSON::Field(key: "key")]
      getter key : String

      @[JSON::Field(key: "organization_id")]
      getter organization_id : String

      @[JSON::Field(key: "activation_id")]
      getter activation_id : String
    end
  end
end
