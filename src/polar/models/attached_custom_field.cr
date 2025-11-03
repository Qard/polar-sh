# AttachedCustomField
#
# Schema of a custom field attached to a resource.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a AttachedCustomField
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct AttachedCustomField
      include JSON::Serializable
      # ID of the custom field.
      @[JSON::Field(key: "custom_field_id")]
      getter custom_field_id : String

      @[JSON::Field(key: "custom_field")]
      getter custom_field : CustomField

      # Order of the custom field in the resource.
      @[JSON::Field(key: "order")]
      getter order : Int64

      # Whether the value is required for this custom field.
      @[JSON::Field(key: "required")]
      getter required : Bool
    end
  end
end
