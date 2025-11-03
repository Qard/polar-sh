# BenefitPublic
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a BenefitPublic
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct BenefitPublic
      include JSON::Serializable
      # The ID of the benefit.
      @[JSON::Field(key: "id")]
      getter id : String

      # Creation timestamp of the object.
      @[JSON::Field(key: "created_at")]
      getter created_at : Time

      # Last modification timestamp of the object.
      @[JSON::Field(key: "modified_at")]
      getter modified_at : JSON::Any

      # The type of the benefit.
      @[JSON::Field(key: "type")]
      getter type : BenefitType

      # The description of the benefit.
      @[JSON::Field(key: "description")]
      getter description : String

      # Whether the benefit is selectable when creating a product.
      @[JSON::Field(key: "selectable")]
      getter selectable : Bool

      # Whether the benefit is deletable.
      @[JSON::Field(key: "deletable")]
      getter deletable : Bool

      # The ID of the organization owning the benefit.
      @[JSON::Field(key: "organization_id")]
      getter organization_id : String
    end
  end
end
