# RefundedAlready
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a RefundedAlready
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct RefundedAlready
      include JSON::Serializable
      @[JSON::Field(key: "error")]
      getter error : String

      @[JSON::Field(key: "detail")]
      getter detail : String
    end
  end
end
