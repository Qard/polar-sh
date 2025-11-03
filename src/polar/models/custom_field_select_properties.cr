# CustomFieldSelectProperties
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomFieldSelectProperties
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomFieldSelectProperties
      include JSON::Serializable
      @[JSON::Field(key: "form_label")]
      getter form_label : String?

      @[JSON::Field(key: "form_help_text")]
      getter form_help_text : String?

      @[JSON::Field(key: "form_placeholder")]
      getter form_placeholder : String?

      @[JSON::Field(key: "options")]
      getter options : Array(CustomFieldSelectOption)
    end
  end
end
