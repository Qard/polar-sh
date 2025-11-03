# AddressDict
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a AddressDict
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct AddressDict
      include JSON::Serializable
      @[JSON::Field(key: "line1")]
      getter line1 : String?

      @[JSON::Field(key: "line2")]
      getter line2 : String?

      @[JSON::Field(key: "postal_code")]
      getter postal_code : String?

      @[JSON::Field(key: "city")]
      getter city : String?

      @[JSON::Field(key: "state")]
      getter state : String?

      @[JSON::Field(key: "country")]
      getter country : String
    end
  end
end
