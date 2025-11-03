# Filter
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a Filter
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct Filter
      include JSON::Serializable
      @[JSON::Field(key: "conjunction")]
      getter conjunction : FilterConjunction

      @[JSON::Field(key: "clauses")]
      getter clauses : Array(JSON::Any)
    end
  end
end
