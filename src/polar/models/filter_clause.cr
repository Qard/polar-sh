# FilterClause
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a FilterClause
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct FilterClause
      include JSON::Serializable
      @[JSON::Field(key: "property")]
      getter property : String

      @[JSON::Field(key: "operator")]
      getter operator : FilterOperator

      @[JSON::Field(key: "value")]
      getter value : JSON::Any
    end
  end
end
