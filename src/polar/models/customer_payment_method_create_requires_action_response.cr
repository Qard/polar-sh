# CustomerPaymentMethodCreateRequiresActionResponse
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomerPaymentMethodCreateRequiresActionResponse
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomerPaymentMethodCreateRequiresActionResponse
      include JSON::Serializable
      @[JSON::Field(key: "status")]
      getter status : String

      @[JSON::Field(key: "client_secret")]
      getter client_secret : String
    end
  end
end
