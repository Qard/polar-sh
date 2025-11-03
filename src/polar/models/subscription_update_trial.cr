# SubscriptionUpdateTrial
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a SubscriptionUpdateTrial
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct SubscriptionUpdateTrial
      include JSON::Serializable
      # Set or extend the trial period of the subscription. If set to now, the trial will end immediately.
      @[JSON::Field(key: "trial_end")]
      getter trial_end : JSON::Any
    end
  end
end
