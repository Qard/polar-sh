# EventCreateExternalCustomer
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a EventCreateExternalCustomer
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct EventCreateExternalCustomer
      include JSON::Serializable
      # The timestamp of the event.
      @[JSON::Field(key: "timestamp")]
      getter timestamp : Time?

      # The name of the event.
      @[JSON::Field(key: "name")]
      getter name : String

      # The ID of the organization owning the event. Required unless you use an organization token.
      @[JSON::Field(key: "organization_id")]
      getter organization_id : JSON::Any?

      # Key-value object allowing you to store additional information about the event. Some keys like _llm are structured data that are handled specially by Polar.
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
      getter metadata : EventMetadataInput?

      # ID of the customer in your system associated with the event.
      @[JSON::Field(key: "external_customer_id")]
      getter external_customer_id : String
    end
  end
end
