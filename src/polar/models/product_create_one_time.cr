# ProductCreateOneTime
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a ProductCreateOneTime
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct ProductCreateOneTime
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

      # States that the product is a one-time purchase.
      @[JSON::Field(key: "recurring_interval")]
      getter recurring_interval : Nil?

      # One-time products don't have a recurring interval count.
      @[JSON::Field(key: "recurring_interval_count")]
      getter recurring_interval_count : Nil?
    end
  end
end
