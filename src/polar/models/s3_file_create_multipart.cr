# S3FileCreateMultipart
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a S3FileCreateMultipart
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct S3FileCreateMultipart
      include JSON::Serializable
      @[JSON::Field(key: "parts")]
      getter parts : Array(S3FileCreatePart)
    end
  end
end
