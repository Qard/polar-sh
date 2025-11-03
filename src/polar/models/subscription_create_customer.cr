# SubscriptionCreateCustomer
#
# Create a subscription for an existing customer.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a SubscriptionCreateCustomer
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct SubscriptionCreateCustomer
      include JSON::Serializable
      # Key-value object allowing you to store additional information.
      #
      # The key must be a string with a maximum length of 40 characters.
      # The value must be either:
      #
      #  A string with a maximum length of 500 characters
      #  An integer
      #  A floating-point number
      #  A boolean
      #
      # You can store up to 50 key-value pairs.
      @[JSON::Field(key: "metadata")]
      getter metadata : Hash(String, JSON::Any)?

      # The ID of the recurring product to subscribe to. Must be a free product, otherwise the customer should go through a checkout flow.
      @[JSON::Field(key: "product_id")]
      getter product_id : String

      # The ID of the customer to create the subscription for.
      @[JSON::Field(key: "customer_id")]
      getter customer_id : String
    end
  end
end
