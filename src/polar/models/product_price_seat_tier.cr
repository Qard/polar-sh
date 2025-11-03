# ProductPriceSeatTier
#
# A pricing tier for seat-based pricing.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a ProductPriceSeatTier
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct ProductPriceSeatTier
      include JSON::Serializable
      # Minimum number of seats (inclusive)
      @[JSON::Field(key: "min_seats")]
      getter min_seats : Int64

      # Maximum number of seats (inclusive). None for unlimited.
      @[JSON::Field(key: "max_seats")]
      getter max_seats : JSON::Any?

      # Price per seat in cents for this tier
      @[JSON::Field(key: "price_per_seat")]
      getter price_per_seat : Int64
    end
  end
end
