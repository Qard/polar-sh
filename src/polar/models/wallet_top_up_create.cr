# WalletTopUpCreate
#
# Request schema to top-up a wallet.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a WalletTopUpCreate
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct WalletTopUpCreate
      include JSON::Serializable
      # The amount to top-up the wallet by, in cents.
      @[JSON::Field(key: "amount")]
      getter amount : Int64

      # The currency. Currently, only usd is supported. It should match the wallet's currency.
      @[JSON::Field(key: "currency")]
      getter currency : String
    end
  end
end
