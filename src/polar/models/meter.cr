# Meter
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a Meter
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct Meter
      include JSON::Serializable
      @[JSON::Field(key: "metadata")]
      getter metadata : Hash(String, JSON::Any)

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

      # The filter to apply on events that'll be used to calculate the meter.
      @[JSON::Field(key: "filter")]
      getter filter : Filter

      # The aggregation to apply on the filtered events to calculate the meter.
      @[JSON::Field(key: "aggregation")]
      getter aggregation : JSON::Any

      # The ID of the organization owning the meter.
      @[JSON::Field(key: "organization_id")]
      getter organization_id : String

      # Whether the meter is archived and the time it was archived.
      @[JSON::Field(key: "archived_at")]
      getter archived_at : JSON::Any?
    end
  end
end
