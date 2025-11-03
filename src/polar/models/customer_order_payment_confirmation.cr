# CustomerOrderPaymentConfirmation
#
# Response after confirming a retry payment.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomerOrderPaymentConfirmation
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomerOrderPaymentConfirmation
      include JSON::Serializable
      # Payment status after confirmation.
      @[JSON::Field(key: "status")]
      getter status : String

      # Client secret for handling additional actions.
      @[JSON::Field(key: "client_secret")]
      getter client_secret : JSON::Any?

      # Error message if confirmation failed.
      @[JSON::Field(key: "error")]
      getter error : JSON::Any?
    end
  end
end
