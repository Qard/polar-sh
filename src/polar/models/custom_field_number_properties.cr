# CustomFieldNumberProperties
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomFieldNumberProperties
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomFieldNumberProperties
      include JSON::Serializable
      @[JSON::Field(key: "form_label")]
      getter form_label : String?

      @[JSON::Field(key: "form_help_text")]
      getter form_help_text : String?

      @[JSON::Field(key: "form_placeholder")]
      getter form_placeholder : String?

      @[JSON::Field(key: "ge")]
      getter ge : Int64?

      @[JSON::Field(key: "le")]
      getter le : Int64?
    end
  end
end
