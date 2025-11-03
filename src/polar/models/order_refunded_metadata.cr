# OrderRefundedMetadata
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a OrderRefundedMetadata
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct OrderRefundedMetadata
      include JSON::Serializable
      @[JSON::Field(key: "order_id")]
      getter order_id : String

      @[JSON::Field(key: "refunded_amount")]
      getter refunded_amount : Int64

      @[JSON::Field(key: "currency")]
      getter currency : String

      @[JSON::Field(key: "backfilled")]
      getter backfilled : Bool?
    end
  end
end
