# CheckoutLinkUpdate
#
# Schema to update an existing checkout link.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CheckoutLinkUpdate
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CheckoutLinkUpdate
      include JSON::Serializable
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

      # List of products that will be available to select at checkout.
      @[JSON::Field(key: "products")]
      getter products : JSON::Any?

      @[JSON::Field(key: "label")]
      getter label : JSON::Any?

      # Whether to allow the customer to apply discount codes. If you apply a discount through discount_id, it'll still be applied, but the customer won't be able to change it.
      @[JSON::Field(key: "allow_discount_codes")]
      getter allow_discount_codes : JSON::Any?

      # Whether to require the customer to fill their full billing address, instead of just the country. Customers in the US will always be required to fill their full address, regardless of this setting.
      @[JSON::Field(key: "require_billing_address")]
      getter require_billing_address : JSON::Any?

      # ID of the discount to apply to the checkout. If the discount is not applicable anymore when opening the checkout link, it'll be ignored.
      @[JSON::Field(key: "discount_id")]
      getter discount_id : JSON::Any?

      # URL where the customer will be redirected after a successful payment.You can add the checkout_id={CHECKOUT_ID} query parameter to retrieve the checkout session id.
      @[JSON::Field(key: "success_url")]
      getter success_url : JSON::Any?
    end
  end
end
