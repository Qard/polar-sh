# CustomFieldCreateNumber
#
# Schema to create a custom field of type number.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomFieldCreateNumber
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomFieldCreateNumber
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

      @[JSON::Field(key: "type")]
      getter type : String

      # Identifier of the custom field. It'll be used as key when storing the value. Must be unique across the organization.It can only contain ASCII letters, numbers and hyphens.
      @[JSON::Field(key: "slug")]
      getter slug : String

      # Name of the custom field.
      @[JSON::Field(key: "name")]
      getter name : String

      # The ID of the organization owning the custom field. Required unless you use an organization token.
      @[JSON::Field(key: "organization_id")]
      getter organization_id : JSON::Any?

      @[JSON::Field(key: "properties")]
      getter properties : CustomFieldNumberProperties
    end
  end
end
