# CustomerSubscriptionUpdateSeats
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomerSubscriptionUpdateSeats
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomerSubscriptionUpdateSeats
      include JSON::Serializable
      # Update the number of seats for this subscription.
      @[JSON::Field(key: "seats")]
      getter seats : Int64

      # Determine how to handle the proration billing. If not provided, will use the default organization setting.
      @[JSON::Field(key: "proration_behavior")]
      getter proration_behavior : JSON::Any?
    end
  end
end
