# LicenseKeyCustomer
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a LicenseKeyCustomer
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct LicenseKeyCustomer
      include JSON::Serializable
      # The ID of the customer.
      @[JSON::Field(key: "id")]
      getter id : String

      # Creation timestamp of the object.
      @[JSON::Field(key: "created_at")]
      getter created_at : Time

      # Last modification timestamp of the object.
      @[JSON::Field(key: "modified_at")]
      getter modified_at : JSON::Any

      @[JSON::Field(key: "metadata")]
      getter metadata : Hash(String, JSON::Any)

      # The ID of the customer in your system. This must be unique within the organization. Once set, it can't be updated.
      @[JSON::Field(key: "external_id")]
      getter external_id : JSON::Any

      # The email address of the customer. This must be unique within the organization.
      @[JSON::Field(key: "email")]
      getter email : String

      # Whether the customer email address is verified. The address is automatically verified when the customer accesses the customer portal using their email address.
      @[JSON::Field(key: "email_verified")]
      getter email_verified : Bool

      # The name of the customer.
      @[JSON::Field(key: "name")]
      getter name : JSON::Any

      @[JSON::Field(key: "billing_address")]
      getter billing_address : JSON::Any

      @[JSON::Field(key: "tax_id")]
      getter tax_id : JSON::Any

      # The ID of the organization owning the customer.
      @[JSON::Field(key: "organization_id")]
      getter organization_id : String

      # Timestamp for when the customer was soft deleted.
      @[JSON::Field(key: "deleted_at")]
      getter deleted_at : JSON::Any

      @[JSON::Field(key: "avatar_url")]
      getter avatar_url : String
    end
  end
end
