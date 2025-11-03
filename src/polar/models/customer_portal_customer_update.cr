# CustomerPortalCustomerUpdate
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomerPortalCustomerUpdate
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomerPortalCustomerUpdate
      include JSON::Serializable
      @[JSON::Field(key: "billing_name")]
      getter billing_name : JSON::Any?

      @[JSON::Field(key: "billing_address")]
      getter billing_address : JSON::Any?

      @[JSON::Field(key: "tax_id")]
      getter tax_id : JSON::Any?
    end
  end
end
