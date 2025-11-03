# Files
#
# API client for files resource operations.
#
# This class provides methods for interacting with files-related endpoints
# in the Polar.sh API. All methods return JSON response strings that can be
# parsed into appropriate model types.
#
# Auto-generated from OpenAPI spec
module Polar
  module Api
    # API client for files operations
    class Files
      Log = ::Log.for(self)

      # Creates a new Files instance
      #
      # @param client [Client] The Polar API client instance
      def initialize(@client : Client)
        Log.debug { "Initialized Files API client" }
      end

      # List Files
      #
      # List files.
      #
      # Scopes: files:read files:write
      #
      # **Endpoint:** `GET /v1/files/`
      #
      # **Parameters:**
      # - `organization_id` (optional): Filter by organization ID.
      # - `ids` (optional): Filter by file ID.
      # - `page` (optional): Page number, defaults to 1.
      # - `limit` (optional): Size of a page, defaults to 10. Maximum is 100.
      #
      # **Returns:** Polar::Models::ListResource(Polar::Models::FileRead)
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def list(organization_id : String? = nil, ids : String? = nil, page : Int32? = nil, limit : Int32? = nil) : Polar::Models::ListResource(Polar::Models::FileRead)
        Log.debug { "Calling list" }
        url = "/v1/files/"
        query_params = {} of String => String
        query_params["organization_id"] = organization_id.to_s if organization_id
        query_params["ids"] = ids.to_s if ids
        query_params["page"] = page.to_s if page
        query_params["limit"] = limit.to_s if limit
        url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
        Log.trace { "Query params: #{query_params}" }
        response = @client.request("GET", url)
        result = Polar::Models::ListResource(Polar::Models::FileRead).from_json(response)
        Log.debug { "list completed successfully" }
        result
      end

      # Create File
      #
      # Create a file.
      #
      # Scopes: files:write
      #
      # **Endpoint:** `POST /v1/files/`
      #
      # **Parameters:**
      # - `body` (required): Request body as Polar::Models::FileCreate
      #
      # **Returns:** Polar::Models::FileUpload
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def create(body : Polar::Models::FileCreate) : Polar::Models::FileUpload
        Log.debug { "Calling create" }
        url = "/v1/files/"
        response = @client.request("POST", url, body: body.to_json)
        result = Polar::Models::FileUpload.from_json(response)
        Log.debug { "create completed successfully" }
        result
      end

      # Complete File Upload
      #
      # Complete a file upload.
      #
      # Scopes: files:write
      #
      # **Endpoint:** `POST /v1/files/{id}/uploaded`
      #
      # **Parameters:**
      # - `id` (required): The file ID.
      # - `body` (required): Request body as Polar::Models::FileUploadCompleted
      #
      # **Returns:** Polar::Models::DownloadableFileRead
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def uploaded(id : String, body : Polar::Models::FileUploadCompleted) : Polar::Models::DownloadableFileRead
        Log.debug { "Calling uploaded" }
        url = "/v1/files/#{id}/uploaded"
        response = @client.request("POST", url, body: body.to_json)
        result = Polar::Models::DownloadableFileRead.from_json(response)
        Log.debug { "uploaded completed successfully" }
        result
      end

      # Update File
      #
      # Update a file.
      #
      # Scopes: files:write
      #
      # **Endpoint:** `PATCH /v1/files/{id}`
      #
      # **Parameters:**
      # - `id` (required): The file ID.
      # - `body` (required): Request body as Polar::Models::FilePatch
      #
      # **Returns:** Polar::Models::DownloadableFileRead
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def update(id : String, body : Polar::Models::FilePatch) : Polar::Models::DownloadableFileRead
        Log.debug { "Calling update" }
        url = "/v1/files/#{id}"
        response = @client.request("PATCH", url, body: body.to_json)
        result = Polar::Models::DownloadableFileRead.from_json(response)
        Log.debug { "update completed successfully" }
        result
      end

      # Delete File
      #
      # Delete a file.
      #
      # Scopes: files:write
      #
      # **Endpoint:** `DELETE /v1/files/{id}`
      #
      # **Parameters:**
      # - `id` (required): Path parameter
      #
      # **Returns:** JSON response string
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def delete(id : String)
        Log.debug { "Calling delete" }
        url = "/v1/files/#{id}"
        response = @client.request("DELETE", url)
        Log.debug { "delete completed successfully" }
        response
      end
    end
  end

  # Extend Client class with files API accessor
  class Client
    # Access the files API
    #
    # @return [Api::Files] The files API client
    def files : Api::Files
      Api::Files.new(self)
    end
  end
end
