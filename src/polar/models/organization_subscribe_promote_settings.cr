# OrganizationSubscribePromoteSettings
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a OrganizationSubscribePromoteSettings
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct OrganizationSubscribePromoteSettings
      include JSON::Serializable
      # Promote email subscription (free)
      @[JSON::Field(key: "promote")]
      getter promote : Bool?

      # Show subscription count publicly
      @[JSON::Field(key: "show_count")]
      getter show_count : Bool?

      # Include free subscribers in total count
      @[JSON::Field(key: "count_free")]
      getter count_free : Bool?
    end
  end
end
