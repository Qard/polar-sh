# CustomerSession
#
# A customer session that can be used to authenticate as a customer.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomerSession
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomerSession
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

      @[JSON::Field(key: "token")]
      getter token : String

      @[JSON::Field(key: "expires_at")]
      getter expires_at : Time

      @[JSON::Field(key: "return_url")]
      getter return_url : JSON::Any

      @[JSON::Field(key: "customer_portal_url")]
      getter customer_portal_url : String

      @[JSON::Field(key: "customer_id")]
      getter customer_id : String

      @[JSON::Field(key: "customer")]
      getter customer : Customer
    end
  end
end
