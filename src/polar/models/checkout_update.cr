# CheckoutUpdate
#
# Update an existing checkout session using an access token.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CheckoutUpdate
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CheckoutUpdate
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

      # The interval unit for the trial period.
      @[JSON::Field(key: "trial_interval")]
      getter trial_interval : JSON::Any?

      # The number of interval units for the trial period.
      @[JSON::Field(key: "trial_interval_count")]
      getter trial_interval_count : JSON::Any?

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

      # ID of the discount to apply to the checkout.
      @[JSON::Field(key: "discount_id")]
      getter discount_id : JSON::Any?

      # Whether to allow the customer to apply discount codes. If you apply a discount through discount_id, it'll still be applied, but the customer won't be able to change it.
      @[JSON::Field(key: "allow_discount_codes")]
      getter allow_discount_codes : JSON::Any?

      # Whether to require the customer to fill their full billing address, instead of just the country. Customers in the US will always be required to fill their full address, regardless of this setting. If you preset the billing address, this setting will be automatically set to true.
      @[JSON::Field(key: "require_billing_address")]
      getter require_billing_address : JSON::Any?

      @[JSON::Field(key: "customer_ip_address")]
      getter customer_ip_address : JSON::Any?

      # Key-value object allowing you to store additional information that'll be copied to the created customer.
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
      @[JSON::Field(key: "customer_metadata")]
      getter customer_metadata : JSON::Any?

      # URL where the customer will be redirected after a successful payment.You can add the checkout_id={CHECKOUT_ID} query parameter to retrieve the checkout session id.
      @[JSON::Field(key: "success_url")]
      getter success_url : JSON::Any?

      # When set, a back button will be shown in the checkout to return to this URL.
      @[JSON::Field(key: "return_url")]
      getter return_url : JSON::Any?

      # If you plan to embed the checkout session, set this to the Origin of the embedding page. It'll allow the Polar iframe to communicate with the parent page.
      @[JSON::Field(key: "embed_origin")]
      getter embed_origin : JSON::Any?
    end
  end
end
