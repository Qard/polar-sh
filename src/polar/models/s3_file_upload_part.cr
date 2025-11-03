# S3FileUploadPart
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a S3FileUploadPart
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct S3FileUploadPart
      include JSON::Serializable
      @[JSON::Field(key: "number")]
      getter number : Int64

      @[JSON::Field(key: "chunk_start")]
      getter chunk_start : Int64

      @[JSON::Field(key: "chunk_end")]
      getter chunk_end : Int64

      @[JSON::Field(key: "checksum_sha256_base64")]
      getter checksum_sha256_base64 : JSON::Any?

      @[JSON::Field(key: "url")]
      getter url : String

      @[JSON::Field(key: "expires_at")]
      getter expires_at : Time

      @[JSON::Field(key: "headers")]
      getter headers : Hash(String, String)?
    end
  end
end
