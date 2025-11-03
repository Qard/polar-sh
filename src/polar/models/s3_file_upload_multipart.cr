# S3FileUploadMultipart
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a S3FileUploadMultipart
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct S3FileUploadMultipart
      include JSON::Serializable
      @[JSON::Field(key: "id")]
      getter id : String

      @[JSON::Field(key: "path")]
      getter path : String

      @[JSON::Field(key: "parts")]
      getter parts : Array(S3FileUploadPart)
    end
  end
end
