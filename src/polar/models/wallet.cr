# Wallet
#
# A wallet represents a customer's balance in your organization.
#
# They can top-up their wallet, and use the balance to pay for usage.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a Wallet
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct Wallet
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

      # The ID of the customer that owns the wallet.
      @[JSON::Field(key: "customer_id")]
      getter customer_id : String

      # The current balance of the wallet, in cents.
      @[JSON::Field(key: "balance")]
      getter balance : Int64

      # The currency of the wallet.
      @[JSON::Field(key: "currency")]
      getter currency : String
    end
  end
end
