# SeatsList
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a SeatsList
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct SeatsList
      include JSON::Serializable
      # List of seats
      @[JSON::Field(key: "seats")]
      getter seats : Array(CustomerSeat)

      # Number of available seats
      @[JSON::Field(key: "available_seats")]
      getter available_seats : Int64

      # Total number of seats for the subscription
      @[JSON::Field(key: "total_seats")]
      getter total_seats : Int64
    end
  end
end
