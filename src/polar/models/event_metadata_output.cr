# EventMetadataOutput
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a EventMetadataOutput
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct EventMetadataOutput
      include JSON::Serializable
      @[JSON::Field(key: "_cost")]
      getter _cost : CostMetadataOutput?

      @[JSON::Field(key: "_llm")]
      getter _llm : LLMMetadata?
    end
  end
end
