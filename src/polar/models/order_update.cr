# OrderUpdate
#
# Schema to update an order.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a OrderUpdate
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct OrderUpdate
      include JSON::Serializable
      # The name of the customer that should appear on the invoice. Can't be updated after the invoice is generated.
      @[JSON::Field(key: "billing_name")]
      getter billing_name : JSON::Any

      # The address of the customer that should appear on the invoice. Can't be updated after the invoice is generated.
      @[JSON::Field(key: "billing_address")]
      getter billing_address : JSON::Any
    end
  end
end
