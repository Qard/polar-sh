# PaymentMethodCardMetadata
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a PaymentMethodCardMetadata
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct PaymentMethodCardMetadata
      include JSON::Serializable
      @[JSON::Field(key: "brand")]
      getter brand : String

      @[JSON::Field(key: "last4")]
      getter last4 : String

      @[JSON::Field(key: "exp_month")]
      getter exp_month : Int64

      @[JSON::Field(key: "exp_year")]
      getter exp_year : Int64

      @[JSON::Field(key: "wallet")]
      getter wallet : JSON::Any?
    end
  end
end
