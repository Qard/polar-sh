# BenefitGrantGitHubRepositoryProperties
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a BenefitGrantGitHubRepositoryProperties
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct BenefitGrantGitHubRepositoryProperties
      include JSON::Serializable
      @[JSON::Field(key: "account_id")]
      getter account_id : JSON::Any?

      @[JSON::Field(key: "repository_owner")]
      getter repository_owner : String?

      @[JSON::Field(key: "repository_name")]
      getter repository_name : String?

      @[JSON::Field(key: "permission")]
      getter permission : String?

      @[JSON::Field(key: "granted_account_id")]
      getter granted_account_id : String?
    end
  end
end
