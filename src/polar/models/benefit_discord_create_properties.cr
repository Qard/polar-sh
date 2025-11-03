# BenefitDiscordCreateProperties
#
# Properties to create a benefit of type discord.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a BenefitDiscordCreateProperties
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct BenefitDiscordCreateProperties
      include JSON::Serializable
      @[JSON::Field(key: "guild_token")]
      getter guild_token : String

      # The ID of the Discord role to grant.
      @[JSON::Field(key: "role_id")]
      getter role_id : String

      # Whether to kick the member from the Discord server on revocation.
      @[JSON::Field(key: "kick_member")]
      getter kick_member : Bool
    end
  end
end
