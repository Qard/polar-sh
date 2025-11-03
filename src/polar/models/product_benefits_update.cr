# ProductBenefitsUpdate
#
# Schema to update the benefits granted by a product.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a ProductBenefitsUpdate
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct ProductBenefitsUpdate
      include JSON::Serializable
      # List of benefit IDs. Each one must be on the same organization as the product.
      @[JSON::Field(key: "benefits")]
      getter benefits : Array(String)
    end
  end
end
