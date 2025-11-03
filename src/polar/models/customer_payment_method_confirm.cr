# CustomerPaymentMethodConfirm
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomerPaymentMethodConfirm
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomerPaymentMethodConfirm
      include JSON::Serializable
      @[JSON::Field(key: "setup_intent_id")]
      getter setup_intent_id : String

      @[JSON::Field(key: "set_default")]
      getter set_default : Bool
    end
  end
end
