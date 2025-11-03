# CustomerCustomerSession
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomerCustomerSession
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomerCustomerSession
      include JSON::Serializable
      @[JSON::Field(key: "expires_at")]
      getter expires_at : Time

      @[JSON::Field(key: "return_url")]
      getter return_url : JSON::Any
    end
  end
end
