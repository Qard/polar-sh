# BenefitGrantDiscordProperties
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a BenefitGrantDiscordProperties
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct BenefitGrantDiscordProperties
      include JSON::Serializable
      @[JSON::Field(key: "account_id")]
      getter account_id : JSON::Any?

      @[JSON::Field(key: "guild_id")]
      getter guild_id : String?

      @[JSON::Field(key: "role_id")]
      getter role_id : String?

      @[JSON::Field(key: "granted_account_id")]
      getter granted_account_id : String?
    end
  end
end
