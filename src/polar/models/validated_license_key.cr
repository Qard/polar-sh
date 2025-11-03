# ValidatedLicenseKey
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a ValidatedLicenseKey
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct ValidatedLicenseKey
      include JSON::Serializable
      # The ID of the object.
      @[JSON::Field(key: "id")]
      getter id : String

      # Creation timestamp of the object.
      @[JSON::Field(key: "created_at")]
      getter created_at : Time

      # Last modification timestamp of the object.
      @[JSON::Field(key: "modified_at")]
      getter modified_at : JSON::Any

      @[JSON::Field(key: "organization_id")]
      getter organization_id : String

      @[JSON::Field(key: "customer_id")]
      getter customer_id : String

      @[JSON::Field(key: "customer")]
      getter customer : LicenseKeyCustomer

      # The benefit ID.
      @[JSON::Field(key: "benefit_id")]
      getter benefit_id : String

      @[JSON::Field(key: "key")]
      getter key : String

      @[JSON::Field(key: "display_key")]
      getter display_key : String

      @[JSON::Field(key: "status")]
      getter status : LicenseKeyStatus

      @[JSON::Field(key: "limit_activations")]
      getter limit_activations : JSON::Any

      @[JSON::Field(key: "usage")]
      getter usage : Int64

      @[JSON::Field(key: "limit_usage")]
      getter limit_usage : JSON::Any

      @[JSON::Field(key: "validations")]
      getter validations : Int64

      @[JSON::Field(key: "last_validated_at")]
      getter last_validated_at : JSON::Any

      @[JSON::Field(key: "expires_at")]
      getter expires_at : JSON::Any

      @[JSON::Field(key: "activation")]
      getter activation : JSON::Any?
    end
  end
end
