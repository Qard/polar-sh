# CustomerCustomerMeterMeter
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomerCustomerMeterMeter
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomerCustomerMeterMeter
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

      # The name of the meter. Will be shown on customer's invoices and usage.
      @[JSON::Field(key: "name")]
      getter name : String
    end
  end
end
