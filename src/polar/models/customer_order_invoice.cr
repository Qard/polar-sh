# CustomerOrderInvoice
#
# Order's invoice data.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomerOrderInvoice
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomerOrderInvoice
      include JSON::Serializable
      # The URL to the invoice.
      @[JSON::Field(key: "url")]
      getter url : String
    end
  end
end
