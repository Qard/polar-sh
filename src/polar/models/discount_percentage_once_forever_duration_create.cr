# DiscountPercentageOnceForeverDurationCreate
#
# Schema to create a percentage discount that is applied once or forever.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a DiscountPercentageOnceForeverDurationCreate
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct DiscountPercentageOnceForeverDurationCreate
      include JSON::Serializable
      @[JSON::Field(key: "duration")]
      getter duration : DiscountDuration

      # Type of the discount.
      @[JSON::Field(key: "type")]
      getter type : DiscountType

      # Discount percentage in basis points.
      #
      # A basis point is 1/100th of a percent.
      # For example, to create a 25.5% discount, set this to 2550.
      @[JSON::Field(key: "basis_points")]
      getter basis_points : Int64

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

      # Name of the discount. Will be displayed to the customer when the discount is applied.
      @[JSON::Field(key: "name")]
      getter name : String

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

      @[JSON::Field(key: "products")]
      getter products : JSON::Any?

      # The ID of the organization owning the discount. Required unless you use an organization token.
      @[JSON::Field(key: "organization_id")]
      getter organization_id : JSON::Any?
    end
  end
end
