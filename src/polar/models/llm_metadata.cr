# LLMMetadata
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a LLMMetadata
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct LLMMetadata
      include JSON::Serializable
      # The vendor of the event.
      @[JSON::Field(key: "vendor")]
      getter vendor : String

      # The model used for the event.
      @[JSON::Field(key: "model")]
      getter model : String

      # The LLM prompt used for the event.
      @[JSON::Field(key: "prompt")]
      getter prompt : JSON::Any?

      # The LLM response used for the event.
      @[JSON::Field(key: "response")]
      getter response : JSON::Any?

      # The number of LLM input tokens used for the event.
      @[JSON::Field(key: "input_tokens")]
      getter input_tokens : Int64

      # The number of LLM cached tokens that were used for the event.
      @[JSON::Field(key: "cached_input_tokens")]
      getter cached_input_tokens : Int64?

      # The number of LLM output tokens used for the event.
      @[JSON::Field(key: "output_tokens")]
      getter output_tokens : Int64

      # The total number of LLM tokens used for the event.
      @[JSON::Field(key: "total_tokens")]
      getter total_tokens : Int64
    end
  end
end
