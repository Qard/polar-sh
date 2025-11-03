# CheckoutDiscountFixedRepeatDuration
#
# Schema for a fixed amount discount that is applied on every invoice
# for a certain number of months.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CheckoutDiscountFixedRepeatDuration
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CheckoutDiscountFixedRepeatDuration
      include JSON::Serializable
      @[JSON::Field(key: "duration")]
      getter duration : DiscountDuration

      @[JSON::Field(key: "duration_in_months")]
      getter duration_in_months : Int64

      @[JSON::Field(key: "type")]
      getter type : DiscountType

      @[JSON::Field(key: "amount")]
      getter amount : Int64

      @[JSON::Field(key: "currency")]
      getter currency : String

      # The ID of the object.
      @[JSON::Field(key: "id")]
      getter id : String

      @[JSON::Field(key: "name")]
      getter name : String

      @[JSON::Field(key: "code")]
      getter code : JSON::Any
    end
  end
end
