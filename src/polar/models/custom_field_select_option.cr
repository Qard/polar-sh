# CustomFieldSelectOption
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomFieldSelectOption
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomFieldSelectOption
      include JSON::Serializable
      @[JSON::Field(key: "value")]
      getter value : String

      @[JSON::Field(key: "label")]
      getter label : String
    end
  end
end
