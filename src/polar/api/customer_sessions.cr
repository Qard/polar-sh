# CustomerSessions
#
# API client for customer_sessions resource operations.
#
# This class provides methods for interacting with customer_sessions-related endpoints
# in the Polar.sh API. All methods return JSON response strings that can be
# parsed into appropriate model types.
#
# Auto-generated from OpenAPI spec
module Polar
  module Api
    # API client for customer_sessions operations
    class CustomerSessions
      Log = ::Log.for(self)

      # Creates a new CustomerSessions instance
      #
      # @param client [Client] The Polar API client instance
      def initialize(@client : Client)
        Log.debug { "Initialized CustomerSessions API client" }
      end

      # Create Customer Session
      #
      # Create a customer session.
      #
      # Scopes: customer_sessions:write
      #
      # **Endpoint:** `POST /v1/customer-sessions/`
      #
      # **Parameters:**
      # - `body` (required): Request body as Polar::Models::CustomerSessionCustomerIDCreate
      #
      # **Returns:** Polar::Models::CustomerSession
      #
      # **Raises:**
      # - `ResourceNotFoundError` on 404
      # - `NotPermittedError` on 403
      # - `HTTPValidationError` on 422
      # - `PolarError` on other errors
      def create(body : Polar::Models::CustomerSessionCustomerIDCreate) : Polar::Models::CustomerSession
        Log.debug { "Calling create" }
        url = "/v1/customer-sessions/"
        response = @client.request("POST", url, body: body.to_json)
        result = Polar::Models::CustomerSession.from_json(response)
        Log.debug { "create completed successfully" }
        result
      end
    end
  end

  # Extend Client class with customer_sessions API accessor
  class Client
    # Access the customer_sessions API
    #
    # @return [Api::CustomerSessions] The customer_sessions API client
    def customer_sessions : Api::CustomerSessions
      Api::CustomerSessions.new(self)
    end
  end
end
