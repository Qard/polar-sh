# CustomerPortalOAuthAccount
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomerPortalOAuthAccount
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomerPortalOAuthAccount
      include JSON::Serializable
      @[JSON::Field(key: "account_id")]
      getter account_id : String

      @[JSON::Field(key: "account_username")]
      getter account_username : JSON::Any
    end
  end
end
