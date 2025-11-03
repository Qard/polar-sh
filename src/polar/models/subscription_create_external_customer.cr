# SubscriptionCreateExternalCustomer
#
# Create a subscription for an existing customer identified by an external ID.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a SubscriptionCreateExternalCustomer
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct SubscriptionCreateExternalCustomer
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

      # The ID of the customer in your system to create the subscription for. It must already exist in Polar.
      @[JSON::Field(key: "external_customer_id")]
      getter external_customer_id : String
    end
  end
end
