# CustomerUpdate
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomerUpdate
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomerUpdate
      include JSON::Serializable
      # Key-value object allowing you to store additional information.
      #
      # The key must be a string with a maximum length of 40 characters.
      # The value must be either:
      #
      #  A string with a maximum length of 500 characters
      #  An integer
      #  A floating-point number
      #  A boolean
      #
      # You can store up to 50 key-value pairs.
      @[JSON::Field(key: "metadata")]
      getter metadata : Hash(String, JSON::Any)?

      # The email address of the customer. This must be unique within the organization.
      @[JSON::Field(key: "email")]
      getter email : JSON::Any?

      @[JSON::Field(key: "name")]
      getter name : JSON::Any?

      @[JSON::Field(key: "billing_address")]
      getter billing_address : JSON::Any?

      @[JSON::Field(key: "tax_id")]
      getter tax_id : JSON::Any?

      # The ID of the customer in your system. This must be unique within the organization. Once set, it can't be updated.
      @[JSON::Field(key: "external_id")]
      getter external_id : JSON::Any?
    end
  end
end
