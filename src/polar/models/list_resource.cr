# ListResource(T)
#
# Generic paginated list container for Polar.sh API responses.
#
# This struct wraps paginated list responses from the API, providing
# access to the items and pagination metadata.
#
# ## Usage
#
# ```
# result = client.organizations.list
# result.items.each do |org|
#   puts org.name
# end
# puts "Page #{result.pagination.page} of #{result.pagination.max_page}"
# ```
#
# Auto-generated from OpenAPI spec

module Polar
  module Models
    # Generic paginated list response
    #
    # @param T The type of items in the list
    struct ListResource(T)
      include JSON::Serializable

      # The items in this page of results
      @[JSON::Field(key: "items")]
      getter items : Array(T)

      # Pagination metadata
      @[JSON::Field(key: "pagination")]
      getter pagination : Pagination
    end
  end
end
