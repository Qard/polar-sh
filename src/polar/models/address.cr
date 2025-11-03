# Address
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a Address
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct Address
      include JSON::Serializable
      @[JSON::Field(key: "line1")]
      getter line1 : JSON::Any?

      @[JSON::Field(key: "line2")]
      getter line2 : JSON::Any?

      @[JSON::Field(key: "postal_code")]
      getter postal_code : JSON::Any?

      @[JSON::Field(key: "city")]
      getter city : JSON::Any?

      @[JSON::Field(key: "state")]
      getter state : JSON::Any?

      @[JSON::Field(key: "country")]
      getter country : String
    end
  end
end
