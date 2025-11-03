# ProductMediaFileCreate
#
# Schema to create a file to be used as a product media file.
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a ProductMediaFileCreate
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct ProductMediaFileCreate
      include JSON::Serializable
      @[JSON::Field(key: "organization_id")]
      getter organization_id : JSON::Any?

      @[JSON::Field(key: "name")]
      getter name : String

      # MIME type of the file. Only images are supported for this type of file.
      @[JSON::Field(key: "mime_type")]
      getter mime_type : String

      # Size of the file. A maximum of 10 MB is allowed for this type of file.
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
