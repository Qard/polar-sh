# ExistingProductPrice
#
# A price that already exists for this product.
#
# Useful when updating a product if you want to keep an existing price.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a ExistingProductPrice
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct ExistingProductPrice
      include JSON::Serializable
      @[JSON::Field(key: "id")]
      getter id : String
    end
  end
end
