# FilePatch
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a FilePatch
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct FilePatch
      include JSON::Serializable
      @[JSON::Field(key: "name")]
      getter name : JSON::Any?

      @[JSON::Field(key: "version")]
      getter version : JSON::Any?
    end
  end
end
