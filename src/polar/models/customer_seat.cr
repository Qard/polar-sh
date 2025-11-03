# CustomerSeat
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomerSeat
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomerSeat
      include JSON::Serializable
      # Creation timestamp of the object.
      @[JSON::Field(key: "created_at")]
      getter created_at : Time

      # Last modification timestamp of the object.
      @[JSON::Field(key: "modified_at")]
      getter modified_at : JSON::Any

      # The seat ID
      @[JSON::Field(key: "id")]
      getter id : String

      # The subscription ID (for recurring seats)
      @[JSON::Field(key: "subscription_id")]
      getter subscription_id : JSON::Any?

      # The order ID (for one-time purchase seats)
      @[JSON::Field(key: "order_id")]
      getter order_id : JSON::Any?

      # Status of the seat
      @[JSON::Field(key: "status")]
      getter status : SeatStatus

      # The assigned customer ID
      @[JSON::Field(key: "customer_id")]
      getter customer_id : JSON::Any?

      # The assigned customer email
      @[JSON::Field(key: "customer_email")]
      getter customer_email : JSON::Any?

      # When the invitation token expires
      @[JSON::Field(key: "invitation_token_expires_at")]
      getter invitation_token_expires_at : JSON::Any?

      # When the seat was claimed
      @[JSON::Field(key: "claimed_at")]
      getter claimed_at : JSON::Any?

      # When the seat was revoked
      @[JSON::Field(key: "revoked_at")]
      getter revoked_at : JSON::Any?

      # Additional metadata for the seat
      @[JSON::Field(key: "seat_metadata")]
      getter seat_metadata : JSON::Any?
    end
  end
end
