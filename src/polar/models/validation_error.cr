# ValidationError
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a ValidationError
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct ValidationError
      include JSON::Serializable
      @[JSON::Field(key: "loc")]
      getter loc : Array(JSON::Any)

      @[JSON::Field(key: "msg")]
      getter msg : String

      @[JSON::Field(key: "type")]
      getter type : String
    end
  end
end
