# AttachedCustomFieldCreate
#
# Schema to attach a custom field to a resource.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a AttachedCustomFieldCreate
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct AttachedCustomFieldCreate
      include JSON::Serializable
      # ID of the custom field to attach.
      @[JSON::Field(key: "custom_field_id")]
      getter custom_field_id : String

      # Whether the value is required for this custom field.
      @[JSON::Field(key: "required")]
      getter required : Bool
    end
  end
end
