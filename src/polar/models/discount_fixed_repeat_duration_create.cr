# DiscountFixedRepeatDurationCreate
#
# Schema to create a fixed amount discount that is applied on every invoice
# for a certain number of months.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a DiscountFixedRepeatDurationCreate
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct DiscountFixedRepeatDurationCreate
      include JSON::Serializable
      @[JSON::Field(key: "duration")]
      getter duration : DiscountDuration

      # Number of months the discount should be applied.
      #
      # For this to work on yearly pricing, you should multiply this by 12.
      # For example, to apply the discount for 2 years, set this to 24.
      @[JSON::Field(key: "duration_in_months")]
      getter duration_in_months : Int64

      # Type of the discount.
      @[JSON::Field(key: "type")]
      getter type : DiscountType

      # Fixed amount to discount from the invoice total.
      @[JSON::Field(key: "amount")]
      getter amount : Int64

      # The currency. Currently, only usd is supported.
      @[JSON::Field(key: "currency")]
      getter currency : String?

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
