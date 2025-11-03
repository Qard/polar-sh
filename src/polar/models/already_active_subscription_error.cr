# AlreadyActiveSubscriptionError
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a AlreadyActiveSubscriptionError
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct AlreadyActiveSubscriptionError
      include JSON::Serializable
      @[JSON::Field(key: "error")]
      getter error : String

      @[JSON::Field(key: "detail")]
      getter detail : String
    end
  end
end
