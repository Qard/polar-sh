# Product
#
# A product.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a Product
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct Product
      include JSON::Serializable
      # The ID of the object.
      @[JSON::Field(key: "id")]
      getter id : String

      # Creation timestamp of the object.
      @[JSON::Field(key: "created_at")]
      getter created_at : Time

      # Last modification timestamp of the object.
      @[JSON::Field(key: "modified_at")]
      getter modified_at : JSON::Any

      # The interval unit for the trial period.
      @[JSON::Field(key: "trial_interval")]
      getter trial_interval : JSON::Any

      # The number of interval units for the trial period.
      @[JSON::Field(key: "trial_interval_count")]
      getter trial_interval_count : JSON::Any

      # The name of the product.
      @[JSON::Field(key: "name")]
      getter name : String

      # The description of the product.
      @[JSON::Field(key: "description")]
      getter description : JSON::Any

      # The recurring interval of the product. If None, the product is a one-time purchase.
      @[JSON::Field(key: "recurring_interval")]
      getter recurring_interval : JSON::Any

      # Number of interval units of the subscription. If this is set to 1 the charge will happen every interval (e.g. every month), if set to 2 it will be every other month, and so on. None for one-time products.
      @[JSON::Field(key: "recurring_interval_count")]
      getter recurring_interval_count : JSON::Any

      # Whether the product is a subscription.
      @[JSON::Field(key: "is_recurring")]
      getter is_recurring : Bool

      # Whether the product is archived and no longer available.
      @[JSON::Field(key: "is_archived")]
      getter is_archived : Bool

      # The ID of the organization owning the product.
      @[JSON::Field(key: "organization_id")]
      getter organization_id : String

      @[JSON::Field(key: "metadata")]
      getter metadata : Hash(String, JSON::Any)

      # List of prices for this product.
      @[JSON::Field(key: "prices")]
      getter prices : Array(JSON::Any)

      # List of benefits granted by the product.
      @[JSON::Field(key: "benefits")]
      getter benefits : Array(Benefit)

      # List of medias associated to the product.
      @[JSON::Field(key: "medias")]
      getter medias : Array(ProductMediaFileRead)

      # List of custom fields attached to the product.
      @[JSON::Field(key: "attached_custom_fields")]
      getter attached_custom_fields : Array(AttachedCustomField)
    end
  end
end
