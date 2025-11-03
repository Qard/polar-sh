# CustomerPaymentMethodCreate
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomerPaymentMethodCreate
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomerPaymentMethodCreate
      include JSON::Serializable
      @[JSON::Field(key: "confirmation_token_id")]
      getter confirmation_token_id : String

      @[JSON::Field(key: "set_default")]
      getter set_default : Bool

      @[JSON::Field(key: "return_url")]
      getter return_url : String
    end
  end
end
