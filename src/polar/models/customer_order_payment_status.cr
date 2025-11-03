# CustomerOrderPaymentStatus
#
# Payment status for an order.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomerOrderPaymentStatus
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomerOrderPaymentStatus
      include JSON::Serializable
      # Current payment status.
      @[JSON::Field(key: "status")]
      getter status : String

      # Error message if payment failed.
      @[JSON::Field(key: "error")]
      getter error : JSON::Any?
    end
  end
end
