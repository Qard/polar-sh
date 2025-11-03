# OrganizationDetails
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a OrganizationDetails
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct OrganizationDetails
      include JSON::Serializable
      # Brief information about you and your business.
      @[JSON::Field(key: "about")]
      getter about : String

      # Description of digital products being sold.
      @[JSON::Field(key: "product_description")]
      getter product_description : String

      # How the organization will integrate and use Polar.
      @[JSON::Field(key: "intended_use")]
      getter intended_use : String

      # Main customer acquisition channels.
      @[JSON::Field(key: "customer_acquisition")]
      getter customer_acquisition : Array(String)

      # Estimated revenue in the next 12 months
      @[JSON::Field(key: "future_annual_revenue")]
      getter future_annual_revenue : Int64

      # Switching from another platform?
      @[JSON::Field(key: "switching")]
      getter switching : Bool?

      # Which platform the organization is migrating from.
      @[JSON::Field(key: "switching_from")]
      getter switching_from : JSON::Any?

      # Revenue from last year if applicable.
      @[JSON::Field(key: "previous_annual_revenue")]
      getter previous_annual_revenue : Int64?
    end
  end
end
