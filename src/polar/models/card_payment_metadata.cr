# CardPaymentMetadata
#
# Additional metadata for a card payment method.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CardPaymentMetadata
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CardPaymentMetadata
      include JSON::Serializable
      # The brand of the card used for the payment.
      @[JSON::Field(key: "brand")]
      getter brand : String

      # The last 4 digits of the card number.
      @[JSON::Field(key: "last4")]
      getter last4 : String
    end
  end
end
