# ProductPriceSeatBasedCreate
#
# Schema to create a seat-based price with volume-based tiers.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a ProductPriceSeatBasedCreate
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct ProductPriceSeatBasedCreate
      include JSON::Serializable
      @[JSON::Field(key: "amount_type")]
      getter amount_type : String

      # The currency. Currently, only usd is supported.
      @[JSON::Field(key: "price_currency")]
      getter price_currency : String?

      # Tiered pricing based on seat quantity
      @[JSON::Field(key: "seat_tiers")]
      getter seat_tiers : ProductPriceSeatTiers
    end
  end
end
