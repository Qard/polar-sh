# DiscountUpdate
#
# Schema to update a discount.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a DiscountUpdate
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct DiscountUpdate
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

      @[JSON::Field(key: "name")]
      getter name : JSON::Any?

      # Code customers can use to apply the discount during checkout. Must be between 3 and 256 characters long and contain only alphanumeric characters.If not provided, the discount can only be applied via the API.
      @[JSON::Field(key: "code")]
      getter code : JSON::Any?

      # Optional timestamp after which the discount is redeemable.
      @[JSON::Field(key: "starts_at")]
      getter starts_at : JSON::Any?

      # Optional timestamp after which the discount is no longer redeemable.
      @[JSON::Field(key: "ends_at")]
      getter ends_at : JSON::Any?

      # Optional maximum number of times the discount can be redeemed.
      @[JSON::Field(key: "max_redemptions")]
      getter max_redemptions : JSON::Any?

      @[JSON::Field(key: "duration")]
      getter duration : JSON::Any?

      @[JSON::Field(key: "duration_in_months")]
      getter duration_in_months : JSON::Any?

      @[JSON::Field(key: "type")]
      getter type : JSON::Any?

      @[JSON::Field(key: "amount")]
      getter amount : JSON::Any?

      @[JSON::Field(key: "currency")]
      getter currency : JSON::Any?

      @[JSON::Field(key: "basis_points")]
      getter basis_points : JSON::Any?

      @[JSON::Field(key: "products")]
      getter products : JSON::Any?
    end
  end
end
