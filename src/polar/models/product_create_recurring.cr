# ProductCreateRecurring
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a ProductCreateRecurring
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct ProductCreateRecurring
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

      # The name of the product.
      @[JSON::Field(key: "name")]
      getter name : String

      # The description of the product.
      @[JSON::Field(key: "description")]
      getter description : JSON::Any?

      # List of available prices for this product. It should contain at most one static price (fixed, custom or free), and any number of metered prices. Metered prices are not supported on one-time purchase products.
      @[JSON::Field(key: "prices")]
      getter prices : Array(JSON::Any)

      # List of file IDs. Each one must be on the same organization as the product, of type product_media and correctly uploaded.
      @[JSON::Field(key: "medias")]
      getter medias : JSON::Any?

      # List of custom fields to attach.
      @[JSON::Field(key: "attached_custom_fields")]
      getter attached_custom_fields : Array(AttachedCustomFieldCreate)?

      # The ID of the organization owning the product. Required unless you use an organization token.
      @[JSON::Field(key: "organization_id")]
      getter organization_id : JSON::Any?

      # The interval unit for the trial period.
      @[JSON::Field(key: "trial_interval")]
      getter trial_interval : JSON::Any?

      # The number of interval units for the trial period.
      @[JSON::Field(key: "trial_interval_count")]
      getter trial_interval_count : JSON::Any?

      # The recurring interval of the product. Note that the day and week values are for internal Polar staff use only.
      @[JSON::Field(key: "recurring_interval")]
      getter recurring_interval : SubscriptionRecurringInterval

      # Number of interval units of the subscription. If this is set to 1 the charge will happen every interval (e.g. every month), if set to 2 it will be every other month, and so on.
      @[JSON::Field(key: "recurring_interval_count")]
      getter recurring_interval_count : Int64?
    end
  end
end
