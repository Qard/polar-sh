# CustomerBenefitGrantGitHubRepositoryUpdate
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a CustomerBenefitGrantGitHubRepositoryUpdate
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct CustomerBenefitGrantGitHubRepositoryUpdate
      include JSON::Serializable
      @[JSON::Field(key: "benefit_type")]
      getter benefit_type : String

      @[JSON::Field(key: "properties")]
      getter properties : CustomerBenefitGrantGitHubRepositoryPropertiesUpdate
    end
  end
end
