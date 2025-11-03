# BenefitGitHubRepositorySubscriberProperties
#
# Properties available to subscribers for a benefit of type github_repository.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a BenefitGitHubRepositorySubscriberProperties
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct BenefitGitHubRepositorySubscriberProperties
      include JSON::Serializable
      # The owner of the repository.
      @[JSON::Field(key: "repository_owner")]
      getter repository_owner : String

      # The name of the repository.
      @[JSON::Field(key: "repository_name")]
      getter repository_name : String
    end
  end
end
