# CustomerSessionCustomerExternalIDCreate
#
# Schema for creating a customer session using an external customer ID.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomerSessionCustomerExternalIDCreate
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomerSessionCustomerExternalIDCreate
      include JSON::Serializable
      # When set, a back button will be shown in the customer portal to return to this URL.
      @[JSON::Field(key: "return_url")]
      getter return_url : JSON::Any?

      # External ID of the customer to create a session for.
      @[JSON::Field(key: "external_customer_id")]
      getter external_customer_id : String
    end
  end
end
