# BenefitGitHubRepositoryCreateProperties
#
# Properties to create a benefit of type github_repository.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a BenefitGitHubRepositoryCreateProperties
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct BenefitGitHubRepositoryCreateProperties
      include JSON::Serializable
      # The owner of the repository.
      @[JSON::Field(key: "repository_owner")]
      getter repository_owner : String

      # The name of the repository.
      @[JSON::Field(key: "repository_name")]
      getter repository_name : String

      # The permission level to grant. Read more about roles and their permissions on [GitHub documentation](https://docs.github.com/en/organizations/managing-user-access-to-your-organizations-repositories/managing-repository-roles/repository-roles-for-an-organization#permissions-for-each-role).
      @[JSON::Field(key: "permission")]
      getter permission : String
    end
  end
end
