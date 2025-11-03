# CustomerStateMeter
#
# An active meter for a customer, with latest consumed and credited units.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomerStateMeter
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomerStateMeter
      include JSON::Serializable
      # The ID of the object.
      @[JSON::Field(key: "id")]
      getter id : String

      # Creation timestamp of the object.
      @[JSON::Field(key: "created_at")]
      getter created_at : Time

      # Last modification timestamp of the object.
      @[JSON::Field(key: "modified_at")]
      getter modified_at : JSON::Any

      # The ID of the meter.
      @[JSON::Field(key: "meter_id")]
      getter meter_id : String

      # The number of consumed units.
      @[JSON::Field(key: "consumed_units")]
      getter consumed_units : Float64

      # The number of credited units.
      @[JSON::Field(key: "credited_units")]
      getter credited_units : Int64

      # The balance of the meter, i.e. the difference between credited and consumed units.
      @[JSON::Field(key: "balance")]
      getter balance : Float64
    end
  end
end
