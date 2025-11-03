# CustomerSubscriptionUpdateProduct
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomerSubscriptionUpdateProduct
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomerSubscriptionUpdateProduct
      include JSON::Serializable
      # Update subscription to another product.
      @[JSON::Field(key: "product_id")]
      getter product_id : String
    end
  end
end
