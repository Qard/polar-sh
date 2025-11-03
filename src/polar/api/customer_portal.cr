# CustomerPortal
#
# API client for customer_portal resource operations.
#
# Auto-generated from OpenAPI spec
module Polar
  module Api
    # CustomerPortal namespace for customer_portal operations
    module CustomerPortal
      # API client for benefit_grants operations in customer_portal context
      class BenefitGrants
        Log = ::Log.for(self)

        # Creates a new BenefitGrants instance
        #
        # @param client [Client] The Polar API client instance
        def initialize(@client : Client)
          Log.debug { "Initialized CustomerPortal::BenefitGrants API client" }
        end

        # List Benefit Grants
        #
        # List benefits grants of the authenticated customer.
        #
        # Scopes: customer_portal:read customer_portal:write
        #
        # **Endpoint:** `GET /v1/customer-portal/benefit-grants/`
        #
        # **Parameters:**
        # - `type` (optional): Filter by benefit type.
        # - `benefit_id` (optional): Filter by benefit ID.
        # - `checkout_id` (optional): Filter by checkout ID.
        # - `order_id` (optional): Filter by order ID.
        # - `subscription_id` (optional): Filter by subscription ID.
        # - `page` (optional): Page number, defaults to 1.
        # - `limit` (optional): Size of a page, defaults to 10. Maximum is 100.
        # - `sorting` (optional): Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign - before the criteria name to sort by descending order.
        #
        # **Returns:** Polar::Models::ListResource(Polar::Models::CustomerBenefitGrant)
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def list(type : String? = nil, benefit_id : String? = nil, checkout_id : String? = nil, order_id : String? = nil, subscription_id : String? = nil, page : Int32? = nil, limit : Int32? = nil, sorting : String? = nil) : Polar::Models::ListResource(Polar::Models::CustomerBenefitGrant)
          Log.debug { "Calling list" }
          url = "/v1/customer-portal/benefit-grants/"
          query_params = {} of String => String
          query_params["type"] = type.to_s if type
          query_params["benefit_id"] = benefit_id.to_s if benefit_id
          query_params["checkout_id"] = checkout_id.to_s if checkout_id
          query_params["order_id"] = order_id.to_s if order_id
          query_params["subscription_id"] = subscription_id.to_s if subscription_id
          query_params["page"] = page.to_s if page
          query_params["limit"] = limit.to_s if limit
          query_params["sorting"] = sorting.to_s if sorting
          url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
          Log.trace { "Query params: #{query_params}" }
          response = @client.request("GET", url)
          result = Polar::Models::ListResource(Polar::Models::CustomerBenefitGrant).from_json(response)
          Log.debug { "list completed successfully" }
          result
        end

        # Get Benefit Grant
        #
        # Get a benefit grant by ID for the authenticated customer.
        #
        # Scopes: customer_portal:read customer_portal:write
        #
        # **Endpoint:** `GET /v1/customer-portal/benefit-grants/{id}`
        #
        # **Parameters:**
        # - `id` (required): The benefit grant ID.
        #
        # **Returns:** Polar::Models::CustomerBenefitGrant
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def get(id : String) : Polar::Models::CustomerBenefitGrant
          Log.debug { "Calling get" }
          url = "/v1/customer-portal/benefit-grants/#{id}"
          response = @client.request("GET", url)
          result = Polar::Models::CustomerBenefitGrant.from_json(response)
          Log.debug { "get completed successfully" }
          result
        end

        # Update Benefit Grant
        #
        # Update a benefit grant for the authenticated customer.
        #
        # Scopes: customer_portal:write
        #
        # **Endpoint:** `PATCH /v1/customer-portal/benefit-grants/{id}`
        #
        # **Parameters:**
        # - `id` (required): The benefit grant ID.
        # - `body` (required): Request body as Polar::Models::CustomerBenefitGrantUpdate
        #
        # **Returns:** Polar::Models::CustomerBenefitGrant
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def update(id : String, body : Polar::Models::CustomerBenefitGrantUpdate) : Polar::Models::CustomerBenefitGrant
          Log.debug { "Calling update" }
          url = "/v1/customer-portal/benefit-grants/#{id}"
          response = @client.request("PATCH", url, body: body.to_json)
          result = Polar::Models::CustomerBenefitGrant.from_json(response)
          Log.debug { "update completed successfully" }
          result
        end
      end

      # API client for customers operations in customer_portal context
      class Customers
        Log = ::Log.for(self)

        # Creates a new Customers instance
        #
        # @param client [Client] The Polar API client instance
        def initialize(@client : Client)
          Log.debug { "Initialized CustomerPortal::Customers API client" }
        end

        # Get Customer
        #
        # Get authenticated customer.
        #
        # Scopes: customer_portal:read customer_portal:write
        #
        # **Endpoint:** `GET /v1/customer-portal/customers/me`
        #
        # **Returns:** Polar::Models::CustomerPortalCustomer
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def get : Polar::Models::CustomerPortalCustomer
          Log.debug { "Calling get" }
          url = "/v1/customer-portal/customers/me"
          response = @client.request("GET", url)
          result = Polar::Models::CustomerPortalCustomer.from_json(response)
          Log.debug { "get completed successfully" }
          result
        end

        # Update Customer
        #
        # Update authenticated customer.
        #
        # Scopes: customer_portal:write
        #
        # **Endpoint:** `PATCH /v1/customer-portal/customers/me`
        #
        # **Parameters:**
        # - `body` (required): Request body as Polar::Models::CustomerPortalCustomerUpdate
        #
        # **Returns:** Polar::Models::CustomerPortalCustomer
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def update(body : Polar::Models::CustomerPortalCustomerUpdate) : Polar::Models::CustomerPortalCustomer
          Log.debug { "Calling update" }
          url = "/v1/customer-portal/customers/me"
          response = @client.request("PATCH", url, body: body.to_json)
          result = Polar::Models::CustomerPortalCustomer.from_json(response)
          Log.debug { "update completed successfully" }
          result
        end

        # List Customer Payment Methods
        #
        # Get saved payment methods of the authenticated customer.
        #
        # Scopes: customer_portal:read customer_portal:write
        #
        # **Endpoint:** `GET /v1/customer-portal/customers/me/payment-methods`
        #
        # **Parameters:**
        # - `page` (optional): Page number, defaults to 1.
        # - `limit` (optional): Size of a page, defaults to 10. Maximum is 100.
        #
        # **Returns:** Polar::Models::ListResource(Polar::Models::CustomerPaymentMethod)
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def list(page : Int32? = nil, limit : Int32? = nil) : Polar::Models::ListResource(Polar::Models::CustomerPaymentMethod)
          Log.debug { "Calling list" }
          url = "/v1/customer-portal/customers/me/payment-methods"
          query_params = {} of String => String
          query_params["page"] = page.to_s if page
          query_params["limit"] = limit.to_s if limit
          url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
          Log.trace { "Query params: #{query_params}" }
          response = @client.request("GET", url)
          result = Polar::Models::ListResource(Polar::Models::CustomerPaymentMethod).from_json(response)
          Log.debug { "list completed successfully" }
          result
        end

        # Add Customer Payment Method
        #
        # Add a payment method to the authenticated customer.
        #
        # Scopes: customer_portal:read customer_portal:write
        #
        # **Endpoint:** `POST /v1/customer-portal/customers/me/payment-methods`
        #
        # **Parameters:**
        # - `body` (required): Request body as Polar::Models::CustomerPaymentMethodCreate
        #
        # **Returns:** Polar::Models::CustomerPaymentMethodCreateResponse
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def add(body : Polar::Models::CustomerPaymentMethodCreate) : Polar::Models::CustomerPaymentMethodCreateResponse
          Log.debug { "Calling add" }
          url = "/v1/customer-portal/customers/me/payment-methods"
          response = @client.request("POST", url, body: body.to_json)
          result = Polar::Models::CustomerPaymentMethodCreateResponse.from_json(response)
          Log.debug { "add completed successfully" }
          result
        end

        # Confirm Customer Payment Method
        #
        # Confirm a payment method for the authenticated customer.
        #
        # Scopes: customer_portal:read customer_portal:write
        #
        # **Endpoint:** `POST /v1/customer-portal/customers/me/payment-methods/confirm`
        #
        # **Parameters:**
        # - `body` (required): Request body as Polar::Models::CustomerPaymentMethodConfirm
        #
        # **Returns:** Polar::Models::CustomerPaymentMethodCreateResponse
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def confirm(body : Polar::Models::CustomerPaymentMethodConfirm) : Polar::Models::CustomerPaymentMethodCreateResponse
          Log.debug { "Calling confirm" }
          url = "/v1/customer-portal/customers/me/payment-methods/confirm"
          response = @client.request("POST", url, body: body.to_json)
          result = Polar::Models::CustomerPaymentMethodCreateResponse.from_json(response)
          Log.debug { "confirm completed successfully" }
          result
        end

        # Delete Customer Payment Method
        #
        # Delete a payment method from the authenticated customer.
        #
        # Scopes: customer_portal:read customer_portal:write
        #
        # **Endpoint:** `DELETE /v1/customer-portal/customers/me/payment-methods/{id}`
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
          url = "/v1/customer-portal/customers/me/payment-methods/#{id}"
          response = @client.request("DELETE", url)
          Log.debug { "delete completed successfully" }
          response
        end
      end

      # API client for customer_meters operations in customer_portal context
      class CustomerMeters
        Log = ::Log.for(self)

        # Creates a new CustomerMeters instance
        #
        # @param client [Client] The Polar API client instance
        def initialize(@client : Client)
          Log.debug { "Initialized CustomerPortal::CustomerMeters API client" }
        end

        # List Meters
        #
        # List meters of the authenticated customer.
        #
        # Scopes: customer_portal:read customer_portal:write
        #
        # **Endpoint:** `GET /v1/customer-portal/meters/`
        #
        # **Parameters:**
        # - `meter_id` (optional): Filter by meter ID.
        # - `query` (optional): Filter by meter name.
        # - `page` (optional): Page number, defaults to 1.
        # - `limit` (optional): Size of a page, defaults to 10. Maximum is 100.
        # - `sorting` (optional): Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign - before the criteria name to sort by descending order.
        #
        # **Returns:** Polar::Models::ListResource(Polar::Models::CustomerCustomerMeter)
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def list(meter_id : String? = nil, query : String? = nil, page : Int32? = nil, limit : Int32? = nil, sorting : String? = nil) : Polar::Models::ListResource(Polar::Models::CustomerCustomerMeter)
          Log.debug { "Calling list" }
          url = "/v1/customer-portal/meters/"
          query_params = {} of String => String
          query_params["meter_id"] = meter_id.to_s if meter_id
          query_params["query"] = query.to_s if query
          query_params["page"] = page.to_s if page
          query_params["limit"] = limit.to_s if limit
          query_params["sorting"] = sorting.to_s if sorting
          url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
          Log.trace { "Query params: #{query_params}" }
          response = @client.request("GET", url)
          result = Polar::Models::ListResource(Polar::Models::CustomerCustomerMeter).from_json(response)
          Log.debug { "list completed successfully" }
          result
        end

        # Get Customer Meter
        #
        # Get a meter by ID for the authenticated customer.
        #
        # Scopes: customer_portal:read customer_portal:write
        #
        # **Endpoint:** `GET /v1/customer-portal/meters/{id}`
        #
        # **Parameters:**
        # - `id` (required): The customer meter ID.
        #
        # **Returns:** Polar::Models::CustomerCustomerMeter
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def get(id : String) : Polar::Models::CustomerCustomerMeter
          Log.debug { "Calling get" }
          url = "/v1/customer-portal/meters/#{id}"
          response = @client.request("GET", url)
          result = Polar::Models::CustomerCustomerMeter.from_json(response)
          Log.debug { "get completed successfully" }
          result
        end
      end

      # API client for seats operations in customer_portal context
      class Seats
        Log = ::Log.for(self)

        # Creates a new Seats instance
        #
        # @param client [Client] The Polar API client instance
        def initialize(@client : Client)
          Log.debug { "Initialized CustomerPortal::Seats API client" }
        end

        # List Seats
        #
        # Scopes: customer_portal:read customer_portal:write
        #
        # **Endpoint:** `GET /v1/customer-portal/seats`
        #
        # **Parameters:**
        # - `subscription_id` (optional): Subscription ID
        # - `order_id` (optional): Order ID
        #
        # **Returns:** Polar::Models::SeatsList
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def list_seats(subscription_id : String? = nil, order_id : String? = nil) : Polar::Models::SeatsList
          Log.debug { "Calling list_seats" }
          url = "/v1/customer-portal/seats"
          query_params = {} of String => String
          query_params["subscription_id"] = subscription_id.to_s if subscription_id
          query_params["order_id"] = order_id.to_s if order_id
          url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
          Log.trace { "Query params: #{query_params}" }
          response = @client.request("GET", url)
          result = Polar::Models::SeatsList.from_json(response)
          Log.debug { "list_seats completed successfully" }
          result
        end

        # Assign Seat
        #
        # Scopes: customer_portal:write
        #
        # **Endpoint:** `POST /v1/customer-portal/seats`
        #
        # **Parameters:**
        # - `body` (required): Request body as Polar::Models::SeatAssign
        #
        # **Returns:** Polar::Models::CustomerSeat
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def assign_seat(body : Polar::Models::SeatAssign) : Polar::Models::CustomerSeat
          Log.debug { "Calling assign_seat" }
          url = "/v1/customer-portal/seats"
          response = @client.request("POST", url, body: body.to_json)
          result = Polar::Models::CustomerSeat.from_json(response)
          Log.debug { "assign_seat completed successfully" }
          result
        end

        # Revoke Seat
        #
        # Scopes: customer_portal:write
        #
        # **Endpoint:** `DELETE /v1/customer-portal/seats/{seat_id}`
        #
        # **Parameters:**
        # - `seat_id` (required): Path parameter
        #
        # **Returns:** Polar::Models::CustomerSeat
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def revoke_seat(seat_id : String) : Polar::Models::CustomerSeat
          Log.debug { "Calling revoke_seat" }
          url = "/v1/customer-portal/seats/#{seat_id}"
          response = @client.request("DELETE", url)
          result = Polar::Models::CustomerSeat.from_json(response)
          Log.debug { "revoke_seat completed successfully" }
          result
        end

        # Resend Invitation
        #
        # Scopes: customer_portal:write
        #
        # **Endpoint:** `POST /v1/customer-portal/seats/{seat_id}/resend`
        #
        # **Parameters:**
        # - `seat_id` (required): Path parameter
        #
        # **Returns:** Polar::Models::CustomerSeat
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def resend_invitation(seat_id : String) : Polar::Models::CustomerSeat
          Log.debug { "Calling resend_invitation" }
          url = "/v1/customer-portal/seats/#{seat_id}/resend"
          response = @client.request("POST", url)
          result = Polar::Models::CustomerSeat.from_json(response)
          Log.debug { "resend_invitation completed successfully" }
          result
        end

        # List Claimed Subscriptions
        #
        # List all subscriptions where the authenticated customer has claimed a seat.
        #
        # Scopes: customer_portal:read customer_portal:write
        #
        # **Endpoint:** `GET /v1/customer-portal/seats/subscriptions`
        #
        # **Returns:** JSON response string
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def list_claimed_subscriptions
          Log.debug { "Calling list_claimed_subscriptions" }
          url = "/v1/customer-portal/seats/subscriptions"
          response = @client.request("GET", url)
          Log.debug { "list_claimed_subscriptions completed successfully" }
          response
        end
      end

      # API client for customer_session operations in customer_portal context
      class CustomerSession
        Log = ::Log.for(self)

        # Creates a new CustomerSession instance
        #
        # @param client [Client] The Polar API client instance
        def initialize(@client : Client)
          Log.debug { "Initialized CustomerPortal::CustomerSession API client" }
        end

        # Introspect Customer Session
        #
        # Introspect the current session and return its information.
        #
        # Scopes: customer_portal:read customer_portal:write
        #
        # **Endpoint:** `GET /v1/customer-portal/customer-session/introspect`
        #
        # **Returns:** Polar::Models::CustomerCustomerSession
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def introspect : Polar::Models::CustomerCustomerSession
          Log.debug { "Calling introspect" }
          url = "/v1/customer-portal/customer-session/introspect"
          response = @client.request("GET", url)
          result = Polar::Models::CustomerCustomerSession.from_json(response)
          Log.debug { "introspect completed successfully" }
          result
        end
      end

      # API client for downloadables operations in customer_portal context
      class Downloadables
        Log = ::Log.for(self)

        # Creates a new Downloadables instance
        #
        # @param client [Client] The Polar API client instance
        def initialize(@client : Client)
          Log.debug { "Initialized CustomerPortal::Downloadables API client" }
        end

        # List Downloadables
        #
        # Scopes: customer_portal:read customer_portal:write
        #
        # **Endpoint:** `GET /v1/customer-portal/downloadables/`
        #
        # **Parameters:**
        # - `benefit_id` (optional): Filter by benefit ID.
        # - `page` (optional): Page number, defaults to 1.
        # - `limit` (optional): Size of a page, defaults to 10. Maximum is 100.
        #
        # **Returns:** Polar::Models::ListResource(Polar::Models::DownloadableRead)
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def list(benefit_id : String? = nil, page : Int32? = nil, limit : Int32? = nil) : Polar::Models::ListResource(Polar::Models::DownloadableRead)
          Log.debug { "Calling list" }
          url = "/v1/customer-portal/downloadables/"
          query_params = {} of String => String
          query_params["benefit_id"] = benefit_id.to_s if benefit_id
          query_params["page"] = page.to_s if page
          query_params["limit"] = limit.to_s if limit
          url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
          Log.trace { "Query params: #{query_params}" }
          response = @client.request("GET", url)
          result = Polar::Models::ListResource(Polar::Models::DownloadableRead).from_json(response)
          Log.debug { "list completed successfully" }
          result
        end
      end

      # API client for license_keys operations in customer_portal context
      class LicenseKeys
        Log = ::Log.for(self)

        # Creates a new LicenseKeys instance
        #
        # @param client [Client] The Polar API client instance
        def initialize(@client : Client)
          Log.debug { "Initialized CustomerPortal::LicenseKeys API client" }
        end

        # List License Keys
        #
        # Scopes: customer_portal:read customer_portal:write
        #
        # **Endpoint:** `GET /v1/customer-portal/license-keys/`
        #
        # **Parameters:**
        # - `benefit_id` (optional): Filter by a specific benefit
        # - `page` (optional): Page number, defaults to 1.
        # - `limit` (optional): Size of a page, defaults to 10. Maximum is 100.
        #
        # **Returns:** Polar::Models::ListResource(Polar::Models::LicenseKeyRead)
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def list(benefit_id : String? = nil, page : Int32? = nil, limit : Int32? = nil) : Polar::Models::ListResource(Polar::Models::LicenseKeyRead)
          Log.debug { "Calling list" }
          url = "/v1/customer-portal/license-keys/"
          query_params = {} of String => String
          query_params["benefit_id"] = benefit_id.to_s if benefit_id
          query_params["page"] = page.to_s if page
          query_params["limit"] = limit.to_s if limit
          url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
          Log.trace { "Query params: #{query_params}" }
          response = @client.request("GET", url)
          result = Polar::Models::ListResource(Polar::Models::LicenseKeyRead).from_json(response)
          Log.debug { "list completed successfully" }
          result
        end

        # Get License Key
        #
        # Get a license key.
        #
        # Scopes: customer_portal:read customer_portal:write
        #
        # **Endpoint:** `GET /v1/customer-portal/license-keys/{id}`
        #
        # **Parameters:**
        # - `id` (required): Path parameter
        #
        # **Returns:** Polar::Models::LicenseKeyWithActivations
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def get(id : String) : Polar::Models::LicenseKeyWithActivations
          Log.debug { "Calling get" }
          url = "/v1/customer-portal/license-keys/#{id}"
          response = @client.request("GET", url)
          result = Polar::Models::LicenseKeyWithActivations.from_json(response)
          Log.debug { "get completed successfully" }
          result
        end

        # Validate License Key
        #
        # Validate a license key.
        #
        # > This endpoint doesn't require authentication and can be safely used on a public
        # > client, like a desktop application or a mobile app.
        # > If you plan to validate a license key on a server, use the /v1/license-keys/validate
        # > endpoint instead.
        #
        # **Endpoint:** `POST /v1/customer-portal/license-keys/validate`
        #
        # **Parameters:**
        # - `body` (required): Request body as Polar::Models::LicenseKeyValidate
        #
        # **Returns:** Polar::Models::ValidatedLicenseKey
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def validate(body : Polar::Models::LicenseKeyValidate) : Polar::Models::ValidatedLicenseKey
          Log.debug { "Calling validate" }
          url = "/v1/customer-portal/license-keys/validate"
          response = @client.request("POST", url, body: body.to_json)
          result = Polar::Models::ValidatedLicenseKey.from_json(response)
          Log.debug { "validate completed successfully" }
          result
        end

        # Activate License Key
        #
        # Activate a license key instance.
        #
        # > This endpoint doesn't require authentication and can be safely used on a public
        # > client, like a desktop application or a mobile app.
        # > If you plan to validate a license key on a server, use the /v1/license-keys/activate
        # > endpoint instead.
        #
        # **Endpoint:** `POST /v1/customer-portal/license-keys/activate`
        #
        # **Parameters:**
        # - `body` (required): Request body as Polar::Models::LicenseKeyActivate
        #
        # **Returns:** Polar::Models::LicenseKeyActivationRead
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def activate(body : Polar::Models::LicenseKeyActivate) : Polar::Models::LicenseKeyActivationRead
          Log.debug { "Calling activate" }
          url = "/v1/customer-portal/license-keys/activate"
          response = @client.request("POST", url, body: body.to_json)
          result = Polar::Models::LicenseKeyActivationRead.from_json(response)
          Log.debug { "activate completed successfully" }
          result
        end

        # Deactivate License Key
        #
        # Deactivate a license key instance.
        #
        # > This endpoint doesn't require authentication and can be safely used on a public
        # > client, like a desktop application or a mobile app.
        # > If you plan to validate a license key on a server, use the /v1/license-keys/deactivate
        # > endpoint instead.
        #
        # **Endpoint:** `POST /v1/customer-portal/license-keys/deactivate`
        #
        # **Parameters:**
        # - `body` (required): Request body as Polar::Models::LicenseKeyDeactivate
        #
        # **Returns:** JSON response string
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def deactivate(body : Polar::Models::LicenseKeyDeactivate)
          Log.debug { "Calling deactivate" }
          url = "/v1/customer-portal/license-keys/deactivate"
          response = @client.request("POST", url, body: body.to_json)
          Log.debug { "deactivate completed successfully" }
          response
        end
      end

      # API client for orders operations in customer_portal context
      class Orders
        Log = ::Log.for(self)

        # Creates a new Orders instance
        #
        # @param client [Client] The Polar API client instance
        def initialize(@client : Client)
          Log.debug { "Initialized CustomerPortal::Orders API client" }
        end

        # List Orders
        #
        # List orders of the authenticated customer.
        #
        # Scopes: customer_portal:read customer_portal:write
        #
        # **Endpoint:** `GET /v1/customer-portal/orders/`
        #
        # **Parameters:**
        # - `product_id` (optional): Filter by product ID.
        # - `product_billing_type` (optional): Filter by product billing type. recurring will filter data corresponding to subscriptions creations or renewals. one_time will filter data corresponding to one-time purchases.
        # - `subscription_id` (optional): Filter by subscription ID.
        # - `query` (optional): Search by product or organization name.
        # - `page` (optional): Page number, defaults to 1.
        # - `limit` (optional): Size of a page, defaults to 10. Maximum is 100.
        # - `sorting` (optional): Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign - before the criteria name to sort by descending order.
        #
        # **Returns:** Polar::Models::ListResource(Polar::Models::CustomerOrder)
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def list(product_id : String? = nil, product_billing_type : String? = nil, subscription_id : String? = nil, query : String? = nil, page : Int32? = nil, limit : Int32? = nil, sorting : String? = nil) : Polar::Models::ListResource(Polar::Models::CustomerOrder)
          Log.debug { "Calling list" }
          url = "/v1/customer-portal/orders/"
          query_params = {} of String => String
          query_params["product_id"] = product_id.to_s if product_id
          query_params["product_billing_type"] = product_billing_type.to_s if product_billing_type
          query_params["subscription_id"] = subscription_id.to_s if subscription_id
          query_params["query"] = query.to_s if query
          query_params["page"] = page.to_s if page
          query_params["limit"] = limit.to_s if limit
          query_params["sorting"] = sorting.to_s if sorting
          url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
          Log.trace { "Query params: #{query_params}" }
          response = @client.request("GET", url)
          result = Polar::Models::ListResource(Polar::Models::CustomerOrder).from_json(response)
          Log.debug { "list completed successfully" }
          result
        end

        # Get Order
        #
        # Get an order by ID for the authenticated customer.
        #
        # Scopes: customer_portal:read customer_portal:write
        #
        # **Endpoint:** `GET /v1/customer-portal/orders/{id}`
        #
        # **Parameters:**
        # - `id` (required): The order ID.
        #
        # **Returns:** Polar::Models::CustomerOrder
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def get(id : String) : Polar::Models::CustomerOrder
          Log.debug { "Calling get" }
          url = "/v1/customer-portal/orders/#{id}"
          response = @client.request("GET", url)
          result = Polar::Models::CustomerOrder.from_json(response)
          Log.debug { "get completed successfully" }
          result
        end

        # Update Order
        #
        # Update an order for the authenticated customer.
        #
        # Scopes: customer_portal:write
        #
        # **Endpoint:** `PATCH /v1/customer-portal/orders/{id}`
        #
        # **Parameters:**
        # - `id` (required): The order ID.
        # - `body` (required): Request body as Polar::Models::CustomerOrderUpdate
        #
        # **Returns:** Polar::Models::CustomerOrder
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def update(id : String, body : Polar::Models::CustomerOrderUpdate) : Polar::Models::CustomerOrder
          Log.debug { "Calling update" }
          url = "/v1/customer-portal/orders/#{id}"
          response = @client.request("PATCH", url, body: body.to_json)
          result = Polar::Models::CustomerOrder.from_json(response)
          Log.debug { "update completed successfully" }
          result
        end

        # Generate Order Invoice
        #
        # Trigger generation of an order's invoice.
        #
        # Scopes: customer_portal:read customer_portal:write
        #
        # **Endpoint:** `POST /v1/customer-portal/orders/{id}/invoice`
        #
        # **Parameters:**
        # - `id` (required): The order ID.
        #
        # **Returns:** JSON response string
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def generate_invoice(id : String)
          Log.debug { "Calling generate_invoice" }
          url = "/v1/customer-portal/orders/#{id}/invoice"
          response = @client.request("POST", url)
          Log.debug { "generate_invoice completed successfully" }
          response
        end

        # Get Order Invoice
        #
        # Get an order's invoice data.
        #
        # Scopes: customer_portal:read customer_portal:write
        #
        # **Endpoint:** `GET /v1/customer-portal/orders/{id}/invoice`
        #
        # **Parameters:**
        # - `id` (required): The order ID.
        #
        # **Returns:** Polar::Models::CustomerOrderInvoice
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def invoice(id : String) : Polar::Models::CustomerOrderInvoice
          Log.debug { "Calling invoice" }
          url = "/v1/customer-portal/orders/#{id}/invoice"
          response = @client.request("GET", url)
          result = Polar::Models::CustomerOrderInvoice.from_json(response)
          Log.debug { "invoice completed successfully" }
          result
        end

        # Get Order Payment Status
        #
        # Get the current payment status for an order.
        #
        # Scopes: customer_portal:read customer_portal:write
        #
        # **Endpoint:** `GET /v1/customer-portal/orders/{id}/payment-status`
        #
        # **Parameters:**
        # - `id` (required): The order ID.
        #
        # **Returns:** Polar::Models::CustomerOrderPaymentStatus
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def get_payment_status(id : String) : Polar::Models::CustomerOrderPaymentStatus
          Log.debug { "Calling get_payment_status" }
          url = "/v1/customer-portal/orders/#{id}/payment-status"
          response = @client.request("GET", url)
          result = Polar::Models::CustomerOrderPaymentStatus.from_json(response)
          Log.debug { "get_payment_status completed successfully" }
          result
        end

        # Confirm Retry Payment
        #
        # Confirm a retry payment using a Stripe confirmation token.
        #
        # Scopes: customer_portal:write
        #
        # **Endpoint:** `POST /v1/customer-portal/orders/{id}/confirm-payment`
        #
        # **Parameters:**
        # - `id` (required): The order ID.
        # - `body` (required): Request body as Polar::Models::CustomerOrderConfirmPayment
        #
        # **Returns:** Polar::Models::CustomerOrderPaymentConfirmation
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def confirm_retry_payment(id : String, body : Polar::Models::CustomerOrderConfirmPayment) : Polar::Models::CustomerOrderPaymentConfirmation
          Log.debug { "Calling confirm_retry_payment" }
          url = "/v1/customer-portal/orders/#{id}/confirm-payment"
          response = @client.request("POST", url, body: body.to_json)
          result = Polar::Models::CustomerOrderPaymentConfirmation.from_json(response)
          Log.debug { "confirm_retry_payment completed successfully" }
          result
        end
      end

      # API client for organizations operations in customer_portal context
      class Organizations
        Log = ::Log.for(self)

        # Creates a new Organizations instance
        #
        # @param client [Client] The Polar API client instance
        def initialize(@client : Client)
          Log.debug { "Initialized CustomerPortal::Organizations API client" }
        end

        # Get Organization
        #
        # Get a customer portal's organization by slug.
        #
        # **Endpoint:** `GET /v1/customer-portal/organizations/{slug}`
        #
        # **Parameters:**
        # - `slug` (required): The organization slug.
        #
        # **Returns:** Polar::Models::CustomerOrganization
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def get(slug : String) : Polar::Models::CustomerOrganization
          Log.debug { "Calling get" }
          url = "/v1/customer-portal/organizations/#{slug}"
          response = @client.request("GET", url)
          result = Polar::Models::CustomerOrganization.from_json(response)
          Log.debug { "get completed successfully" }
          result
        end
      end

      # API client for subscriptions operations in customer_portal context
      class Subscriptions
        Log = ::Log.for(self)

        # Creates a new Subscriptions instance
        #
        # @param client [Client] The Polar API client instance
        def initialize(@client : Client)
          Log.debug { "Initialized CustomerPortal::Subscriptions API client" }
        end

        # List Subscriptions
        #
        # List subscriptions of the authenticated customer.
        #
        # Scopes: customer_portal:read customer_portal:write
        #
        # **Endpoint:** `GET /v1/customer-portal/subscriptions/`
        #
        # **Parameters:**
        # - `product_id` (optional): Filter by product ID.
        # - `active` (optional): Filter by active or cancelled subscription.
        # - `query` (optional): Search by product or organization name.
        # - `page` (optional): Page number, defaults to 1.
        # - `limit` (optional): Size of a page, defaults to 10. Maximum is 100.
        # - `sorting` (optional): Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign - before the criteria name to sort by descending order.
        #
        # **Returns:** Polar::Models::ListResource(Polar::Models::CustomerSubscription)
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def list(product_id : String? = nil, active : String? = nil, query : String? = nil, page : Int32? = nil, limit : Int32? = nil, sorting : String? = nil) : Polar::Models::ListResource(Polar::Models::CustomerSubscription)
          Log.debug { "Calling list" }
          url = "/v1/customer-portal/subscriptions/"
          query_params = {} of String => String
          query_params["product_id"] = product_id.to_s if product_id
          query_params["active"] = active.to_s if active
          query_params["query"] = query.to_s if query
          query_params["page"] = page.to_s if page
          query_params["limit"] = limit.to_s if limit
          query_params["sorting"] = sorting.to_s if sorting
          url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
          Log.trace { "Query params: #{query_params}" }
          response = @client.request("GET", url)
          result = Polar::Models::ListResource(Polar::Models::CustomerSubscription).from_json(response)
          Log.debug { "list completed successfully" }
          result
        end

        # Get Subscription
        #
        # Get a subscription for the authenticated customer.
        #
        # Scopes: customer_portal:read customer_portal:write
        #
        # **Endpoint:** `GET /v1/customer-portal/subscriptions/{id}`
        #
        # **Parameters:**
        # - `id` (required): The subscription ID.
        #
        # **Returns:** Polar::Models::CustomerSubscription
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def get(id : String) : Polar::Models::CustomerSubscription
          Log.debug { "Calling get" }
          url = "/v1/customer-portal/subscriptions/#{id}"
          response = @client.request("GET", url)
          result = Polar::Models::CustomerSubscription.from_json(response)
          Log.debug { "get completed successfully" }
          result
        end

        # Update Subscription
        #
        # Update a subscription of the authenticated customer.
        #
        # Scopes: customer_portal:write
        #
        # **Endpoint:** `PATCH /v1/customer-portal/subscriptions/{id}`
        #
        # **Parameters:**
        # - `id` (required): The subscription ID.
        # - `body` (required): Request body as Polar::Models::CustomerSubscriptionUpdate
        #
        # **Returns:** Polar::Models::CustomerSubscription
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def update(id : String, body : Polar::Models::CustomerSubscriptionUpdate) : Polar::Models::CustomerSubscription
          Log.debug { "Calling update" }
          url = "/v1/customer-portal/subscriptions/#{id}"
          response = @client.request("PATCH", url, body: body.to_json)
          result = Polar::Models::CustomerSubscription.from_json(response)
          Log.debug { "update completed successfully" }
          result
        end

        # Cancel Subscription
        #
        # Cancel a subscription of the authenticated customer.
        #
        # Scopes: customer_portal:write
        #
        # **Endpoint:** `DELETE /v1/customer-portal/subscriptions/{id}`
        #
        # **Parameters:**
        # - `id` (required): The subscription ID.
        #
        # **Returns:** Polar::Models::CustomerSubscription
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def cancel(id : String) : Polar::Models::CustomerSubscription
          Log.debug { "Calling cancel" }
          url = "/v1/customer-portal/subscriptions/#{id}"
          response = @client.request("DELETE", url)
          result = Polar::Models::CustomerSubscription.from_json(response)
          Log.debug { "cancel completed successfully" }
          result
        end
      end

      # API client for wallets operations in customer_portal context
      class Wallets
        Log = ::Log.for(self)

        # Creates a new Wallets instance
        #
        # @param client [Client] The Polar API client instance
        def initialize(@client : Client)
          Log.debug { "Initialized CustomerPortal::Wallets API client" }
        end

        # List Wallets
        #
        # List wallets of the authenticated customer.
        #
        # Scopes: customer_portal:read customer_portal:write
        #
        # **Endpoint:** `GET /v1/customer-portal/wallets/`
        #
        # **Parameters:**
        # - `page` (optional): Page number, defaults to 1.
        # - `limit` (optional): Size of a page, defaults to 10. Maximum is 100.
        # - `sorting` (optional): Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign - before the criteria name to sort by descending order.
        #
        # **Returns:** Polar::Models::ListResource(Polar::Models::CustomerWallet)
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def list(page : Int32? = nil, limit : Int32? = nil, sorting : String? = nil) : Polar::Models::ListResource(Polar::Models::CustomerWallet)
          Log.debug { "Calling list" }
          url = "/v1/customer-portal/wallets/"
          query_params = {} of String => String
          query_params["page"] = page.to_s if page
          query_params["limit"] = limit.to_s if limit
          query_params["sorting"] = sorting.to_s if sorting
          url += "?" + HTTP::Params.encode(query_params) unless query_params.empty?
          Log.trace { "Query params: #{query_params}" }
          response = @client.request("GET", url)
          result = Polar::Models::ListResource(Polar::Models::CustomerWallet).from_json(response)
          Log.debug { "list completed successfully" }
          result
        end

        # Get Wallet
        #
        # Get a wallet by ID for the authenticated customer.
        #
        # Scopes: customer_portal:read customer_portal:write
        #
        # **Endpoint:** `GET /v1/customer-portal/wallets/{id}`
        #
        # **Parameters:**
        # - `id` (required): The wallet ID.
        #
        # **Returns:** Polar::Models::CustomerWallet
        #
        # **Raises:**
        # - `ResourceNotFoundError` on 404
        # - `NotPermittedError` on 403
        # - `HTTPValidationError` on 422
        # - `PolarError` on other errors
        def get(id : String) : Polar::Models::CustomerWallet
          Log.debug { "Calling get" }
          url = "/v1/customer-portal/wallets/#{id}"
          response = @client.request("GET", url)
          result = Polar::Models::CustomerWallet.from_json(response)
          Log.debug { "get completed successfully" }
          result
        end
      end

      # Main CustomerPortal class with resource accessors
      class Base
        def initialize(@client : Client)
        end

        # Access benefit_grants operations
        def benefit_grants : BenefitGrants
          BenefitGrants.new(@client)
        end

        # Access customers operations
        def customers : Customers
          Customers.new(@client)
        end

        # Access customer_meters operations
        def customer_meters : CustomerMeters
          CustomerMeters.new(@client)
        end

        # Access seats operations
        def seats : Seats
          Seats.new(@client)
        end

        # Access customer_session operations
        def customer_session : CustomerSession
          CustomerSession.new(@client)
        end

        # Access downloadables operations
        def downloadables : Downloadables
          Downloadables.new(@client)
        end

        # Access license_keys operations
        def license_keys : LicenseKeys
          LicenseKeys.new(@client)
        end

        # Access orders operations
        def orders : Orders
          Orders.new(@client)
        end

        # Access organizations operations
        def organizations : Organizations
          Organizations.new(@client)
        end

        # Access subscriptions operations
        def subscriptions : Subscriptions
          Subscriptions.new(@client)
        end

        # Access wallets operations
        def wallets : Wallets
          Wallets.new(@client)
        end
      end
    end
  end

  # Extend Client class with customer_portal API accessor
  class Client
    # Access the customer_portal API
    #
    # @return [Api::CustomerPortal::Base] The customer_portal API client
    def customer_portal : Api::CustomerPortal::Base
      Api::CustomerPortal::Base.new(self)
    end
  end
end
