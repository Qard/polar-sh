# CustomerPaymentMethodCreateSucceededResponse
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomerPaymentMethodCreateSucceededResponse
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomerPaymentMethodCreateSucceededResponse
      include JSON::Serializable
      @[JSON::Field(key: "status")]
      getter status : String

      @[JSON::Field(key: "payment_method")]
      getter payment_method : CustomerPaymentMethod
    end
  end
end
