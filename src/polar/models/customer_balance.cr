# CustomerBalance
#
# Customer balance information.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomerBalance
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomerBalance
      include JSON::Serializable
      # Customer balance in cents. Positive values represent credit (customer is owed money), negative values represent debit (customer owes money).
      @[JSON::Field(key: "balance")]
      getter balance : Int64

      # The currency code (ISO 4217) for the balance amount.
      @[JSON::Field(key: "currency")]
      getter currency : String
    end
  end
end
