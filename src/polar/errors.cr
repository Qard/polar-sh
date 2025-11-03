# Polar::Errors
#
# Exception classes for error handling in the Polar.sh API client.
#
# All API errors inherit from `PolarError`, making it easy to catch
# all Polar-related exceptions:
#
# ```
# begin
#   client.organizations.get("invalid-id")
# rescue e : Polar::ResourceNotFoundError
#   puts "Organization not found"
# rescue e : Polar::PolarError
#   puts "API error: #{e.message}"
# end
# ```

module Polar
  # Base exception class for all Polar API errors
  #
  # All other Polar error classes inherit from this, allowing
  # you to catch all Polar-related errors with a single rescue.
  class PolarError < Exception
  end

  # Raised when request validation fails (HTTP 422)
  #
  # This typically indicates that the request parameters or body
  # failed validation on the server side.
  class HTTPValidationError < PolarError
  end

  # Raised when a requested resource is not found (HTTP 404)
  #
  # Example:
  # ```
  # begin
  #   org = client.organizations.get("non-existent-id")
  # rescue e : Polar::ResourceNotFoundError
  #   puts "Organization not found"
  # end
  # ```
  class ResourceNotFoundError < PolarError
  end

  # Raised when access to a resource is not permitted (HTTP 403)
  #
  # This typically indicates insufficient permissions for the
  # requested operation.
  class NotPermittedError < PolarError
  end

  # Raised when webhook signature verification fails
  #
  # This indicates that a webhook payload failed HMAC signature
  # validation, which could mean:
  # - Invalid webhook secret
  # - Tampered payload
  # - Expired timestamp
  class WebhookVerificationError < PolarError
  end
end
