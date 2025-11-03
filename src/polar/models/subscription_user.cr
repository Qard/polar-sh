# SubscriptionUser
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a SubscriptionUser
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct SubscriptionUser
      include JSON::Serializable
      @[JSON::Field(key: "id")]
      getter id : String

      @[JSON::Field(key: "email")]
      getter email : String

      @[JSON::Field(key: "public_name")]
      getter public_name : String

      @[JSON::Field(key: "avatar_url")]
      getter avatar_url : JSON::Any?

      @[JSON::Field(key: "github_username")]
      getter github_username : JSON::Any?
    end
  end
end
