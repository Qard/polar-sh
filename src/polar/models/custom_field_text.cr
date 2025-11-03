# CustomFieldText
#
# Schema for a custom field of type text.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomFieldText
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomFieldText
      include JSON::Serializable
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

      @[JSON::Field(key: "type")]
      getter type : String

      # Identifier of the custom field. It'll be used as key when storing the value.
      @[JSON::Field(key: "slug")]
      getter slug : String

      # Name of the custom field.
      @[JSON::Field(key: "name")]
      getter name : String

      # The ID of the organization owning the custom field.
      @[JSON::Field(key: "organization_id")]
      getter organization_id : String

      @[JSON::Field(key: "properties")]
      getter properties : CustomFieldTextProperties
    end
  end
end
