# CheckoutCustomerBillingAddressFields
#
# Deprecated: Use CheckoutBillingAddressFields instead.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CheckoutCustomerBillingAddressFields
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CheckoutCustomerBillingAddressFields
      include JSON::Serializable
      @[JSON::Field(key: "country")]
      getter country : Bool

      @[JSON::Field(key: "state")]
      getter state : Bool

      @[JSON::Field(key: "city")]
      getter city : Bool

      @[JSON::Field(key: "postal_code")]
      getter postal_code : Bool

      @[JSON::Field(key: "line1")]
      getter line1 : Bool

      @[JSON::Field(key: "line2")]
      getter line2 : Bool
    end
  end
end
