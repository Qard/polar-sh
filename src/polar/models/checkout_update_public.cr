# CheckoutUpdatePublic
#
# Update an existing checkout session using the client secret.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CheckoutUpdatePublic
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CheckoutUpdatePublic
      include JSON::Serializable
      # Key-value object storing custom field values.
      @[JSON::Field(key: "custom_field_data")]
      getter custom_field_data : Hash(String, JSON::Any)?

      # ID of the product to checkout. Must be present in the checkout's product list.
      @[JSON::Field(key: "product_id")]
      getter product_id : JSON::Any?

      # ID of the product price to checkout. Must correspond to a price present in the checkout's product list.
      @[JSON::Field(key: "product_price_id")]
      getter product_price_id : JSON::Any?

      @[JSON::Field(key: "amount")]
      getter amount : JSON::Any?

      # Number of seats for seat-based pricing.
      @[JSON::Field(key: "seats")]
      getter seats : JSON::Any?

      @[JSON::Field(key: "is_business_customer")]
      getter is_business_customer : JSON::Any?

      @[JSON::Field(key: "customer_name")]
      getter customer_name : JSON::Any?

      @[JSON::Field(key: "customer_email")]
      getter customer_email : JSON::Any?

      @[JSON::Field(key: "customer_billing_name")]
      getter customer_billing_name : JSON::Any?

      @[JSON::Field(key: "customer_billing_address")]
      getter customer_billing_address : JSON::Any?

      @[JSON::Field(key: "customer_tax_id")]
      getter customer_tax_id : JSON::Any?

      # Discount code to apply to the checkout.
      @[JSON::Field(key: "discount_code")]
      getter discount_code : JSON::Any?
    end
  end
end
