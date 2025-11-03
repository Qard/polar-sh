# CustomerSessionCustomerIDCreate
#
# Schema for creating a customer session using a customer ID.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomerSessionCustomerIDCreate
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomerSessionCustomerIDCreate
      include JSON::Serializable
      # When set, a back button will be shown in the customer portal to return to this URL.
      @[JSON::Field(key: "return_url")]
      getter return_url : JSON::Any?

      # ID of the customer to create a session for.
      @[JSON::Field(key: "customer_id")]
      getter customer_id : String
    end
  end
end
