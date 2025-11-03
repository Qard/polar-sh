# CheckoutBillingAddressFields
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CheckoutBillingAddressFields
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CheckoutBillingAddressFields
      include JSON::Serializable
      @[JSON::Field(key: "country")]
      getter country : BillingAddressFieldMode

      @[JSON::Field(key: "state")]
      getter state : BillingAddressFieldMode

      @[JSON::Field(key: "city")]
      getter city : BillingAddressFieldMode

      @[JSON::Field(key: "postal_code")]
      getter postal_code : BillingAddressFieldMode

      @[JSON::Field(key: "line1")]
      getter line1 : BillingAddressFieldMode

      @[JSON::Field(key: "line2")]
      getter line2 : BillingAddressFieldMode
    end
  end
end
