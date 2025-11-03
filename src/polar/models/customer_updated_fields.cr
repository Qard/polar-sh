# CustomerUpdatedFields
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomerUpdatedFields
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomerUpdatedFields
      include JSON::Serializable
      @[JSON::Field(key: "name")]
      getter name : JSON::Any?

      @[JSON::Field(key: "email")]
      getter email : JSON::Any?

      @[JSON::Field(key: "billing_address")]
      getter billing_address : JSON::Any?

      @[JSON::Field(key: "tax_id")]
      getter tax_id : JSON::Any?

      @[JSON::Field(key: "metadata")]
      getter metadata : JSON::Any?
    end
  end
end
