# ProductUpdate
#
# Schema to update a product.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a ProductUpdate
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct ProductUpdate
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

      # The interval unit for the trial period.
      @[JSON::Field(key: "trial_interval")]
      getter trial_interval : JSON::Any?

      # The number of interval units for the trial period.
      @[JSON::Field(key: "trial_interval_count")]
      getter trial_interval_count : JSON::Any?

      @[JSON::Field(key: "name")]
      getter name : JSON::Any?

      # The description of the product.
      @[JSON::Field(key: "description")]
      getter description : JSON::Any?

      # The recurring interval of the product. If None, the product is a one-time purchase. Can only be set on legacy recurring products. Once set, it can't be changed.
      @[JSON::Field(key: "recurring_interval")]
      getter recurring_interval : JSON::Any?

      # Number of interval units of the subscription. If this is set to 1 the charge will happen every interval (e.g. every month), if set to 2 it will be every other month, and so on. Once set, it can't be changed.
      @[JSON::Field(key: "recurring_interval_count")]
      getter recurring_interval_count : JSON::Any?

      # Whether the product is archived. If true, the product won't be available for purchase anymore. Existing customers will still have access to their benefits, and subscriptions will continue normally.
      @[JSON::Field(key: "is_archived")]
      getter is_archived : JSON::Any?

      # List of available prices for this product. If you want to keep existing prices, include them in the list as an ExistingProductPrice object.
      @[JSON::Field(key: "prices")]
      getter prices : JSON::Any?

      # List of file IDs. Each one must be on the same organization as the product, of type product_media and correctly uploaded.
      @[JSON::Field(key: "medias")]
      getter medias : JSON::Any?

      @[JSON::Field(key: "attached_custom_fields")]
      getter attached_custom_fields : JSON::Any?
    end
  end
end
