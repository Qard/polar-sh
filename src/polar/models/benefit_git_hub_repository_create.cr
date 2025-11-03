# BenefitGitHubRepositoryCreate
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a BenefitGitHubRepositoryCreate
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct BenefitGitHubRepositoryCreate
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

      @[JSON::Field(key: "type")]
      getter type : String

      # The description of the benefit. Will be displayed on products having this benefit.
      @[JSON::Field(key: "description")]
      getter description : String

      # The ID of the organization owning the benefit. Required unless you use an organization token.
      @[JSON::Field(key: "organization_id")]
      getter organization_id : JSON::Any?

      @[JSON::Field(key: "properties")]
      getter properties : BenefitGitHubRepositoryCreateProperties
    end
  end
end
