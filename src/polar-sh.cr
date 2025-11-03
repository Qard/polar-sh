# Polar.sh API Client for Crystal
#
# This is the main entry point for the Polar.sh Crystal SDK.
# The SDK is auto-generated from a custom OpenAPI generator
# with Crystal-idiomatic code and proper type safety.
#
# Example:
# ```
# require "polar-sh"
#
# client = Polar::Client.new(
#   access_token: ENV["POLAR_ACCESS_TOKEN"],
#   server: :production
# )
#
# # Get an organization
# response = client.organizations.organizations_get(id: "org_123")
# ```

require "http/client"
require "json"

module Polar
  VERSION = "0.1.0"
end

# Core components
require "./polar/errors"
require "./polar/client"
require "./polar/webhooks"

# Generated models - require all models (includes generic types)
require "./polar/models/*"

# Pagination support
require "./polar/paginated_iterator"

# Generated API clients - require all API clients
require "./polar/api/*"
