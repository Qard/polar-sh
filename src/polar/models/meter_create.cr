# MeterCreate
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a MeterCreate
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct MeterCreate
      include JSON::Serializable
      # Key-value object allowing you to store additional information.
      #
      # The key must be a string with a maximum length of 40 characters.
      # The value must be either:
      #
      #  A string with a maximum length of 500 characters
      #  An integer
      #  A floating-point number
      #  A boolean
      #
      # You can store up to 50 key-value pairs.
      @[JSON::Field(key: "metadata")]
      getter metadata : Hash(String, JSON::Any)?

      # The name of the meter. Will be shown on customer's invoices and usage.
      @[JSON::Field(key: "name")]
      getter name : String

      # The filter to apply on events that'll be used to calculate the meter.
      @[JSON::Field(key: "filter")]
      getter filter : Filter

      # The aggregation to apply on the filtered events to calculate the meter.
      @[JSON::Field(key: "aggregation")]
      getter aggregation : JSON::Any

      # The ID of the organization owning the meter. Required unless you use an organization token.
      @[JSON::Field(key: "organization_id")]
      getter organization_id : JSON::Any?
    end
  end
end
