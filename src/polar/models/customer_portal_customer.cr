# CustomerPortalCustomer
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomerPortalCustomer
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomerPortalCustomer
      include JSON::Serializable
      # Creation timestamp of the object.
      @[JSON::Field(key: "created_at")]
      getter created_at : Time

      # Last modification timestamp of the object.
      @[JSON::Field(key: "modified_at")]
      getter modified_at : JSON::Any

      # The ID of the object.
      @[JSON::Field(key: "id")]
      getter id : String

      @[JSON::Field(key: "email")]
      getter email : String

      @[JSON::Field(key: "email_verified")]
      getter email_verified : Bool

      @[JSON::Field(key: "name")]
      getter name : JSON::Any

      @[JSON::Field(key: "billing_name")]
      getter billing_name : JSON::Any

      @[JSON::Field(key: "billing_address")]
      getter billing_address : JSON::Any

      @[JSON::Field(key: "tax_id")]
      getter tax_id : JSON::Any

      @[JSON::Field(key: "oauth_accounts")]
      getter oauth_accounts : Hash(String, CustomerPortalOAuthAccount)

      @[JSON::Field(key: "default_payment_method_id")]
      getter default_payment_method_id : JSON::Any?
    end
  end
end
