# OrganizationFeatureSettings
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a OrganizationFeatureSettings
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct OrganizationFeatureSettings
      include JSON::Serializable
      # If this organization has issue funding enabled
      @[JSON::Field(key: "issue_funding_enabled")]
      getter issue_funding_enabled : Bool?

      # If this organization has seat-based pricing enabled
      @[JSON::Field(key: "seat_based_pricing_enabled")]
      getter seat_based_pricing_enabled : Bool?

      # If this organization has RevOps enabled
      @[JSON::Field(key: "revops_enabled")]
      getter revops_enabled : Bool?

      # If this organization has Wallets enabled
      @[JSON::Field(key: "wallets_enabled")]
      getter wallets_enabled : Bool?
    end
  end
end
