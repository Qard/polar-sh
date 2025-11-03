# CheckoutPublicConfirmed
#
# Checkout session data retrieved using the client secret after confirmation.
#
# It contains a customer session token to retrieve order information
# right after the checkout.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CheckoutPublicConfirmed
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CheckoutPublicConfirmed
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

      # Key-value object storing custom field values.
      @[JSON::Field(key: "custom_field_data")]
      getter custom_field_data : Hash(String, JSON::Any)?

      # Payment processor used.
      @[JSON::Field(key: "payment_processor")]
      getter payment_processor : PaymentProcessor

      @[JSON::Field(key: "status")]
      getter status : String

      # Client secret used to update and complete the checkout session from the client.
      @[JSON::Field(key: "client_secret")]
      getter client_secret : String

      # URL where the customer can access the checkout session.
      @[JSON::Field(key: "url")]
      getter url : String

      # Expiration date and time of the checkout session.
      @[JSON::Field(key: "expires_at")]
      getter expires_at : Time

      # URL where the customer will be redirected after a successful payment.
      @[JSON::Field(key: "success_url")]
      getter success_url : String

      # When set, a back button will be shown in the checkout to return to this URL.
      @[JSON::Field(key: "return_url")]
      getter return_url : JSON::Any

      # When checkout is embedded, represents the Origin of the page embedding the checkout. Used as a security measure to send messages only to the embedding page.
      @[JSON::Field(key: "embed_origin")]
      getter embed_origin : JSON::Any

      # Amount in cents, before discounts and taxes.
      @[JSON::Field(key: "amount")]
      getter amount : Int64

      # Number of seats for seat-based pricing.
      @[JSON::Field(key: "seats")]
      getter seats : JSON::Any?

      # Price per seat in cents for the current seat count, based on the applicable tier. Only relevant for seat-based pricing.
      @[JSON::Field(key: "price_per_seat")]
      getter price_per_seat : JSON::Any?

      # Discount amount in cents.
      @[JSON::Field(key: "discount_amount")]
      getter discount_amount : Int64

      # Amount in cents, after discounts but before taxes.
      @[JSON::Field(key: "net_amount")]
      getter net_amount : Int64

      # Sales tax amount in cents. If null, it means there is no enough information yet to calculate it.
      @[JSON::Field(key: "tax_amount")]
      getter tax_amount : JSON::Any

      # Amount in cents, after discounts and taxes.
      @[JSON::Field(key: "total_amount")]
      getter total_amount : Int64

      # Currency code of the checkout session.
      @[JSON::Field(key: "currency")]
      getter currency : String

      # Interval unit of the trial period, if any. This value is either set from the checkout, if trial_interval is set, or from the selected product.
      @[JSON::Field(key: "active_trial_interval")]
      getter active_trial_interval : JSON::Any

      # Number of interval units of the trial period, if any. This value is either set from the checkout, if trial_interval_count is set, or from the selected product.
      @[JSON::Field(key: "active_trial_interval_count")]
      getter active_trial_interval_count : JSON::Any

      # End date and time of the trial period, if any.
      @[JSON::Field(key: "trial_end")]
      getter trial_end : JSON::Any

      # ID of the organization owning the checkout session.
      @[JSON::Field(key: "organization_id")]
      getter organization_id : String

      # ID of the product to checkout.
      @[JSON::Field(key: "product_id")]
      getter product_id : JSON::Any

      # ID of the product price to checkout.
      @[JSON::Field(key: "product_price_id")]
      getter product_price_id : JSON::Any

      # ID of the discount applied to the checkout.
      @[JSON::Field(key: "discount_id")]
      getter discount_id : JSON::Any

      # Whether to allow the customer to apply discount codes. If you apply a discount through discount_id, it'll still be applied, but the customer won't be able to change it.
      @[JSON::Field(key: "allow_discount_codes")]
      getter allow_discount_codes : Bool

      # Whether to require the customer to fill their full billing address, instead of just the country. Customers in the US will always be required to fill their full address, regardless of this setting. If you preset the billing address, this setting will be automatically set to true.
      @[JSON::Field(key: "require_billing_address")]
      getter require_billing_address : Bool

      # Whether the discount is applicable to the checkout. Typically, free and custom prices are not discountable.
      @[JSON::Field(key: "is_discount_applicable")]
      getter is_discount_applicable : Bool

      # Whether the product price is free, regardless of discounts.
      @[JSON::Field(key: "is_free_product_price")]
      getter is_free_product_price : Bool

      # Whether the checkout requires payment, e.g. in case of free products or discounts that cover the total amount.
      @[JSON::Field(key: "is_payment_required")]
      getter is_payment_required : Bool

      # Whether the checkout requires setting up a payment method, regardless of the amount, e.g. subscriptions that have first free cycles.
      @[JSON::Field(key: "is_payment_setup_required")]
      getter is_payment_setup_required : Bool

      # Whether the checkout requires a payment form, whether because of a payment or payment method setup.
      @[JSON::Field(key: "is_payment_form_required")]
      getter is_payment_form_required : Bool

      @[JSON::Field(key: "customer_id")]
      getter customer_id : JSON::Any

      # Whether the customer is a business or an individual. If true, the customer will be required to fill their full billing address and billing name.
      @[JSON::Field(key: "is_business_customer")]
      getter is_business_customer : Bool

      # Name of the customer.
      @[JSON::Field(key: "customer_name")]
      getter customer_name : JSON::Any

      # Email address of the customer.
      @[JSON::Field(key: "customer_email")]
      getter customer_email : JSON::Any

      @[JSON::Field(key: "customer_ip_address")]
      getter customer_ip_address : JSON::Any

      @[JSON::Field(key: "customer_billing_name")]
      getter customer_billing_name : JSON::Any

      @[JSON::Field(key: "customer_billing_address")]
      getter customer_billing_address : JSON::Any

      @[JSON::Field(key: "customer_tax_id")]
      getter customer_tax_id : JSON::Any

      @[JSON::Field(key: "payment_processor_metadata")]
      getter payment_processor_metadata : Hash(String, String)

      # Determine which billing address fields should be disabled, optional or required in the checkout form.
      @[JSON::Field(key: "billing_address_fields")]
      getter billing_address_fields : CheckoutBillingAddressFields

      # List of products available to select.
      @[JSON::Field(key: "products")]
      getter products : Array(CheckoutProduct)

      # Product selected to checkout.
      @[JSON::Field(key: "product")]
      getter product : JSON::Any

      # Price of the selected product.
      @[JSON::Field(key: "product_price")]
      getter product_price : JSON::Any

      @[JSON::Field(key: "discount")]
      getter discount : JSON::Any

      @[JSON::Field(key: "organization")]
      getter organization : Organization

      @[JSON::Field(key: "attached_custom_fields")]
      getter attached_custom_fields : JSON::Any

      @[JSON::Field(key: "customer_session_token")]
      getter customer_session_token : String
    end
  end
end
