# DiscountPercentageRepeatDuration
#
# Schema for a percentage discount that is applied on every invoice
# for a certain number of months.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a DiscountPercentageRepeatDuration
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct DiscountPercentageRepeatDuration
      include JSON::Serializable
      @[JSON::Field(key: "duration")]
      getter duration : DiscountDuration

      @[JSON::Field(key: "duration_in_months")]
      getter duration_in_months : Int64

      @[JSON::Field(key: "type")]
      getter type : DiscountType

      # Discount percentage in basis points. A basis point is 1/100th of a percent. For example, 1000 basis points equals a 10% discount.
      @[JSON::Field(key: "basis_points")]
      getter basis_points : Int64

      # Creation timestamp of the object.
      @[JSON::Field(key: "created_at")]
      getter created_at : Time

      # Last modification timestamp of the object.
      @[JSON::Field(key: "modified_at")]
      getter modified_at : JSON::Any

      # The ID of the object.
      @[JSON::Field(key: "id")]
      getter id : String

      @[JSON::Field(key: "metadata")]
      getter metadata : Hash(String, JSON::Any)

      # Name of the discount. Will be displayed to the customer when the discount is applied.
      @[JSON::Field(key: "name")]
      getter name : String

      # Code customers can use to apply the discount during checkout.
      @[JSON::Field(key: "code")]
      getter code : JSON::Any

      # Timestamp after which the discount is redeemable.
      @[JSON::Field(key: "starts_at")]
      getter starts_at : JSON::Any

      # Timestamp after which the discount is no longer redeemable.
      @[JSON::Field(key: "ends_at")]
      getter ends_at : JSON::Any

      # Maximum number of times the discount can be redeemed.
      @[JSON::Field(key: "max_redemptions")]
      getter max_redemptions : JSON::Any

      # Number of times the discount has been redeemed.
      @[JSON::Field(key: "redemptions_count")]
      getter redemptions_count : Int64

      # The organization ID.
      @[JSON::Field(key: "organization_id")]
      getter organization_id : String

      @[JSON::Field(key: "products")]
      getter products : Array(DiscountProduct)
    end
  end
end
