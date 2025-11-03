# PaymentMethodCard
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a PaymentMethodCard
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct PaymentMethodCard
      include JSON::Serializable
      # The ID of the object.
      @[JSON::Field(key: "id")]
      getter id : String

      # Creation timestamp of the object.
      @[JSON::Field(key: "created_at")]
      getter created_at : Time

      # Last modification timestamp of the object.
      @[JSON::Field(key: "modified_at")]
      getter modified_at : JSON::Any

      @[JSON::Field(key: "processor")]
      getter processor : PaymentProcessor

      @[JSON::Field(key: "customer_id")]
      getter customer_id : String

      @[JSON::Field(key: "type")]
      getter type : String

      @[JSON::Field(key: "method_metadata")]
      getter method_metadata : PaymentMethodCardMetadata
    end
  end
end
