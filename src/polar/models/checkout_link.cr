# CheckoutLink
#
# Checkout link data.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CheckoutLink
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CheckoutLink
      include JSON::Serializable
      # The ID of the object.
      @[JSON::Field(key: "id")]
      getter id : String

      # Creation timestamp of the object.
      @[JSON::Field(key: "created_at")]
      getter created_at : Time

      # Last modification timestamp of the object.
      @[JSON::Field(key: "modified_at")]
      getter modified_at : JSON::Any

      # The interval unit for the trial period.
      @[JSON::Field(key: "trial_interval")]
      getter trial_interval : JSON::Any

      # The number of interval units for the trial period.
      @[JSON::Field(key: "trial_interval_count")]
      getter trial_interval_count : JSON::Any

      @[JSON::Field(key: "metadata")]
      getter metadata : Hash(String, JSON::Any)

      # Payment processor used.
      @[JSON::Field(key: "payment_processor")]
      getter payment_processor : PaymentProcessor

      # Client secret used to access the checkout link.
      @[JSON::Field(key: "client_secret")]
      getter client_secret : String

      # URL where the customer will be redirected after a successful payment.
      @[JSON::Field(key: "success_url")]
      getter success_url : JSON::Any

      # Optional label to distinguish links internally
      @[JSON::Field(key: "label")]
      getter label : JSON::Any

      # Whether to allow the customer to apply discount codes. If you apply a discount through discount_id, it'll still be applied, but the customer won't be able to change it.
      @[JSON::Field(key: "allow_discount_codes")]
      getter allow_discount_codes : Bool

      # Whether to require the customer to fill their full billing address, instead of just the country. Customers in the US will always be required to fill their full address, regardless of this setting.
      @[JSON::Field(key: "require_billing_address")]
      getter require_billing_address : Bool

      # ID of the discount to apply to the checkout. If the discount is not applicable anymore when opening the checkout link, it'll be ignored.
      @[JSON::Field(key: "discount_id")]
      getter discount_id : JSON::Any

      # The organization ID.
      @[JSON::Field(key: "organization_id")]
      getter organization_id : String

      @[JSON::Field(key: "products")]
      getter products : Array(CheckoutLinkProduct)

      @[JSON::Field(key: "discount")]
      getter discount : JSON::Any

      @[JSON::Field(key: "url")]
      getter url : String
    end
  end
end
