# ProductPriceSeatTiers
#
# List of pricing tiers for seat-based pricing.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a ProductPriceSeatTiers
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct ProductPriceSeatTiers
      include JSON::Serializable
      # List of pricing tiers
      @[JSON::Field(key: "tiers")]
      getter tiers : Array(ProductPriceSeatTier)
    end
  end
end
