# BenefitDiscordProperties
#
# Properties for a benefit of type discord.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a BenefitDiscordProperties
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct BenefitDiscordProperties
      include JSON::Serializable
      # The ID of the Discord server.
      @[JSON::Field(key: "guild_id")]
      getter guild_id : String

      # The ID of the Discord role to grant.
      @[JSON::Field(key: "role_id")]
      getter role_id : String

      # Whether to kick the member from the Discord server on revocation.
      @[JSON::Field(key: "kick_member")]
      getter kick_member : Bool

      @[JSON::Field(key: "guild_token")]
      getter guild_token : String
    end
  end
end
