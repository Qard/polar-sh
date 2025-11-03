# CustomerOrder
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomerOrder
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomerOrder
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

      @[JSON::Field(key: "status")]
      getter status : OrderStatus

      # Whether the order has been paid for.
      @[JSON::Field(key: "paid")]
      getter paid : Bool

      # Amount in cents, before discounts and taxes.
      @[JSON::Field(key: "subtotal_amount")]
      getter subtotal_amount : Int64

      # Discount amount in cents.
      @[JSON::Field(key: "discount_amount")]
      getter discount_amount : Int64

      # Amount in cents, after discounts but before taxes.
      @[JSON::Field(key: "net_amount")]
      getter net_amount : Int64

      # Sales tax amount in cents.
      @[JSON::Field(key: "tax_amount")]
      getter tax_amount : Int64

      # Amount in cents, after discounts and taxes.
      @[JSON::Field(key: "total_amount")]
      getter total_amount : Int64

      # Customer's balance amount applied to this invoice. Can increase the total amount paid, if the customer has a negative balance,  or decrease it, if the customer has a positive balance.Amount in cents.
      @[JSON::Field(key: "applied_balance_amount")]
      getter applied_balance_amount : Int64

      # Amount in cents that is due for this order.
      @[JSON::Field(key: "due_amount")]
      getter due_amount : Int64

      # Amount refunded in cents.
      @[JSON::Field(key: "refunded_amount")]
      getter refunded_amount : Int64

      # Sales tax refunded in cents.
      @[JSON::Field(key: "refunded_tax_amount")]
      getter refunded_tax_amount : Int64

      @[JSON::Field(key: "currency")]
      getter currency : String

      @[JSON::Field(key: "billing_reason")]
      getter billing_reason : OrderBillingReason

      # The name of the customer that should appear on the invoice.
      @[JSON::Field(key: "billing_name")]
      getter billing_name : JSON::Any

      @[JSON::Field(key: "billing_address")]
      getter billing_address : JSON::Any

      # The invoice number associated with this order.
      @[JSON::Field(key: "invoice_number")]
      getter invoice_number : String

      # Whether an invoice has been generated for this order.
      @[JSON::Field(key: "is_invoice_generated")]
      getter is_invoice_generated : Bool

      # Number of seats purchased (for seat-based one-time orders).
      @[JSON::Field(key: "seats")]
      getter seats : JSON::Any?

      @[JSON::Field(key: "customer_id")]
      getter customer_id : String

      @[JSON::Field(key: "product_id")]
      getter product_id : JSON::Any

      @[JSON::Field(key: "discount_id")]
      getter discount_id : JSON::Any

      @[JSON::Field(key: "subscription_id")]
      getter subscription_id : JSON::Any

      @[JSON::Field(key: "checkout_id")]
      getter checkout_id : JSON::Any

      @[JSON::Field(key: "user_id")]
      getter user_id : String

      @[JSON::Field(key: "product")]
      getter product : JSON::Any

      @[JSON::Field(key: "subscription")]
      getter subscription : JSON::Any

      # Line items composing the order.
      @[JSON::Field(key: "items")]
      getter items : Array(OrderItemSchema)

      # A summary description of the order.
      @[JSON::Field(key: "description")]
      getter description : String

      # When the next payment retry is scheduled
      @[JSON::Field(key: "next_payment_attempt_at")]
      getter next_payment_attempt_at : JSON::Any?
    end
  end
end
