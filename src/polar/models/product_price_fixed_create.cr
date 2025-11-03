# ProductPriceFixedCreate
#
# Schema to create a fixed price.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a ProductPriceFixedCreate
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct ProductPriceFixedCreate
      include JSON::Serializable
      @[JSON::Field(key: "amount_type")]
      getter amount_type : String

      # The price in cents.
      @[JSON::Field(key: "price_amount")]
      getter price_amount : Int64

      # The currency. Currently, only usd is supported.
      @[JSON::Field(key: "price_currency")]
      getter price_currency : String?
    end
  end
end
