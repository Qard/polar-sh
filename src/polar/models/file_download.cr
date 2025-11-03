# FileDownload
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a FileDownload
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct FileDownload
      include JSON::Serializable
      # The ID of the object.
      @[JSON::Field(key: "id")]
      getter id : String

      @[JSON::Field(key: "organization_id")]
      getter organization_id : String

      @[JSON::Field(key: "name")]
      getter name : String

      @[JSON::Field(key: "path")]
      getter path : String

      @[JSON::Field(key: "mime_type")]
      getter mime_type : String

      @[JSON::Field(key: "size")]
      getter size : Int64

      @[JSON::Field(key: "storage_version")]
      getter storage_version : JSON::Any

      @[JSON::Field(key: "checksum_etag")]
      getter checksum_etag : JSON::Any

      @[JSON::Field(key: "checksum_sha256_base64")]
      getter checksum_sha256_base64 : JSON::Any

      @[JSON::Field(key: "checksum_sha256_hex")]
      getter checksum_sha256_hex : JSON::Any

      @[JSON::Field(key: "last_modified_at")]
      getter last_modified_at : JSON::Any

      @[JSON::Field(key: "download")]
      getter download : S3DownloadURL

      @[JSON::Field(key: "version")]
      getter version : JSON::Any

      @[JSON::Field(key: "is_uploaded")]
      getter is_uploaded : Bool

      @[JSON::Field(key: "service")]
      getter service : FileServiceTypes

      @[JSON::Field(key: "size_readable")]
      getter size_readable : String
    end
  end
end
