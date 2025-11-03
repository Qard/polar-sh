# DownloadableRead
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    # Model representing a DownloadableRead
    #
    # This struct is auto-generated from the Polar.sh OpenAPI specification.
    # It uses `JSON::Serializable` for automatic JSON parsing and serialization.
    struct DownloadableRead
      include JSON::Serializable
      @[JSON::Field(key: "id")]
      getter id : String

      @[JSON::Field(key: "benefit_id")]
      getter benefit_id : String

      @[JSON::Field(key: "file")]
      getter file : FileDownload
    end
  end
end
