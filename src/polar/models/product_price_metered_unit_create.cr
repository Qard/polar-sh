# ProductPriceMeteredUnitCreate
#
# Schema to create a metered price with a fixed unit price.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a ProductPriceMeteredUnitCreate
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct ProductPriceMeteredUnitCreate
      include JSON::Serializable
      @[JSON::Field(key: "amount_type")]
      getter amount_type : String

      # The ID of the meter associated to the price.
      @[JSON::Field(key: "meter_id")]
      getter meter_id : String

      # The currency. Currently, only usd is supported.
      @[JSON::Field(key: "price_currency")]
      getter price_currency : String?

      # The price per unit in cents. Supports up to 12 decimal places.
      @[JSON::Field(key: "unit_amount")]
      getter unit_amount : JSON::Any

      # Optional maximum amount in cents that can be charged, regardless of the number of units consumed.
      @[JSON::Field(key: "cap_amount")]
      getter cap_amount : JSON::Any?
    end
  end
end
