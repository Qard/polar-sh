# CheckoutDiscountPercentageOnceForeverDuration
#
# Schema for a percentage discount that is applied once or forever.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CheckoutDiscountPercentageOnceForeverDuration
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CheckoutDiscountPercentageOnceForeverDuration
      include JSON::Serializable
      @[JSON::Field(key: "duration")]
      getter duration : DiscountDuration

      @[JSON::Field(key: "type")]
      getter type : DiscountType

      # Discount percentage in basis points. A basis point is 1/100th of a percent. For example, 1000 basis points equals a 10% discount.
      @[JSON::Field(key: "basis_points")]
      getter basis_points : Int64

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
