# ProductPriceCustomCreate
#
# Schema to create a pay-what-you-want price.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a ProductPriceCustomCreate
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct ProductPriceCustomCreate
      include JSON::Serializable
      @[JSON::Field(key: "amount_type")]
      getter amount_type : String

      # The currency. Currently, only usd is supported.
      @[JSON::Field(key: "price_currency")]
      getter price_currency : String?

      # The minimum amount the customer can pay.
      @[JSON::Field(key: "minimum_amount")]
      getter minimum_amount : JSON::Any?

      # The maximum amount the customer can pay.
      @[JSON::Field(key: "maximum_amount")]
      getter maximum_amount : JSON::Any?

      # The initial amount shown to the customer.
      @[JSON::Field(key: "preset_amount")]
      getter preset_amount : JSON::Any?
    end
  end
end
