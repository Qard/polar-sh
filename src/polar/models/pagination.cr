# Pagination
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a Pagination
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct Pagination
      include JSON::Serializable
      @[JSON::Field(key: "total_count")]
      getter total_count : Int64

      @[JSON::Field(key: "max_page")]
      getter max_page : Int64
    end
  end
end
