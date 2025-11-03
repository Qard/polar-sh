# CustomFieldTextProperties
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomFieldTextProperties
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomFieldTextProperties
      include JSON::Serializable
      @[JSON::Field(key: "form_label")]
      getter form_label : String?

      @[JSON::Field(key: "form_help_text")]
      getter form_help_text : String?

      @[JSON::Field(key: "form_placeholder")]
      getter form_placeholder : String?

      @[JSON::Field(key: "textarea")]
      getter textarea : Bool?

      @[JSON::Field(key: "min_length")]
      getter min_length : Int64?

      @[JSON::Field(key: "max_length")]
      getter max_length : Int64?
    end
  end
end
