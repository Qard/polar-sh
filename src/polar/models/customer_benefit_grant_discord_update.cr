# CustomerBenefitGrantDiscordUpdate
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomerBenefitGrantDiscordUpdate
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomerBenefitGrantDiscordUpdate
      include JSON::Serializable
      @[JSON::Field(key: "benefit_type")]
      getter benefit_type : String

      @[JSON::Field(key: "properties")]
      getter properties : CustomerBenefitGrantDiscordPropertiesUpdate
    end
  end
end
