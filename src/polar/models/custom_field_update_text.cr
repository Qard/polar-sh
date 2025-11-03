# CustomFieldUpdateText
#
# Schema to update a custom field of type text.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomFieldUpdateText
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomFieldUpdateText
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

      @[JSON::Field(key: "slug")]
      getter slug : JSON::Any?

      @[JSON::Field(key: "type")]
      getter type : String

      @[JSON::Field(key: "properties")]
      getter properties : JSON::Any?
    end
  end
end
