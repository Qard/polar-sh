# CustomerMeter
#
# An active customer meter, with current consumed and credited units.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomerMeter
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomerMeter
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

      # The ID of the customer.
      @[JSON::Field(key: "customer_id")]
      getter customer_id : String

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

      # The customer associated with this meter.
      @[JSON::Field(key: "customer")]
      getter customer : Customer

      # The meter associated with this customer.
      @[JSON::Field(key: "meter")]
      getter meter : Meter
    end
  end
end
