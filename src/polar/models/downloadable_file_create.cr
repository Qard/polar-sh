# DownloadableFileCreate
#
# Schema to create a file to be associated with the downloadables benefit.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a DownloadableFileCreate
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct DownloadableFileCreate
      include JSON::Serializable
      @[JSON::Field(key: "organization_id")]
      getter organization_id : JSON::Any?

      @[JSON::Field(key: "name")]
      getter name : String

      @[JSON::Field(key: "mime_type")]
      getter mime_type : String

      @[JSON::Field(key: "size")]
      getter size : Int64

      @[JSON::Field(key: "checksum_sha256_base64")]
      getter checksum_sha256_base64 : JSON::Any?

      @[JSON::Field(key: "upload")]
      getter upload : S3FileCreateMultipart

      @[JSON::Field(key: "service")]
      getter service : String

      @[JSON::Field(key: "version")]
      getter version : JSON::Any?
    end
  end
end
