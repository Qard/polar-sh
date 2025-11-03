# CustomerOrganization
#
# Schema of an organization and related data for customer portal.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomerOrganization
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomerOrganization
      include JSON::Serializable
      @[JSON::Field(key: "organization")]
      getter organization : Organization

      @[JSON::Field(key: "products")]
      getter products : Array(CustomerProduct)
    end
  end
end
