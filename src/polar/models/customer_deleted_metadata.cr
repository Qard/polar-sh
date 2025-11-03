# CustomerDeletedMetadata
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomerDeletedMetadata
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomerDeletedMetadata
      include JSON::Serializable
      @[JSON::Field(key: "customer_id")]
      getter customer_id : String

      @[JSON::Field(key: "customer_email")]
      getter customer_email : String

      @[JSON::Field(key: "customer_name")]
      getter customer_name : JSON::Any

      @[JSON::Field(key: "customer_external_id")]
      getter customer_external_id : JSON::Any
    end
  end
end
