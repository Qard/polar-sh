# SubscriptionMeter
#
# Current consumption and spending for a subscription meter.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a SubscriptionMeter
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct SubscriptionMeter
      include JSON::Serializable
      # Creation timestamp of the object.
      @[JSON::Field(key: "created_at")]
      getter created_at : Time

      # Last modification timestamp of the object.
      @[JSON::Field(key: "modified_at")]
      getter modified_at : JSON::Any

      # The ID of the object.
      @[JSON::Field(key: "id")]
      getter id : String

      # The number of consumed units so far in this billing period.
      @[JSON::Field(key: "consumed_units")]
      getter consumed_units : Float64

      # The number of credited units so far in this billing period.
      @[JSON::Field(key: "credited_units")]
      getter credited_units : Int64

      # The amount due in cents so far in this billing period.
      @[JSON::Field(key: "amount")]
      getter amount : Int64

      # The ID of the meter.
      @[JSON::Field(key: "meter_id")]
      getter meter_id : String

      # The meter associated with this subscription.
      @[JSON::Field(key: "meter")]
      getter meter : Meter
    end
  end
end
