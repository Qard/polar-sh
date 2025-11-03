# ProductPriceFreeCreate
#
# Schema to create a free price.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a ProductPriceFreeCreate
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct ProductPriceFreeCreate
      include JSON::Serializable
      @[JSON::Field(key: "amount_type")]
      getter amount_type : String
    end
  end
end
