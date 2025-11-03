# S3DownloadURL
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a S3DownloadURL
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct S3DownloadURL
      include JSON::Serializable
      @[JSON::Field(key: "url")]
      getter url : String

      @[JSON::Field(key: "headers")]
      getter headers : Hash(String, String)?

      @[JSON::Field(key: "expires_at")]
      getter expires_at : Time
    end
  end
end
