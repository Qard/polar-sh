# BenefitDiscordSubscriberProperties
#
# Properties available to subscribers for a benefit of type discord.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a BenefitDiscordSubscriberProperties
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct BenefitDiscordSubscriberProperties
      include JSON::Serializable
      # The ID of the Discord server.
      @[JSON::Field(key: "guild_id")]
      getter guild_id : String
    end
  end
end
