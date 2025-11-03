# Polar.sh Crystal SDK

A Crystal language client for the [Polar.sh API](https://polar.sh), providing a type-safe interface to manage your SaaS business operations.

[![Crystal Version](https://img.shields.io/badge/crystal-%3E%3D1.17.1-blue)](https://crystal-lang.org/)
[![License](https://img.shields.io/badge/license-MIT-green)](./LICENSE)

## Features

- ✨ **Auto-generated from OpenAPI spec** - Always up-to-date with the latest Polar.sh API
- 🔒 **Type-safe** - Leverage Crystal's strong type system
- 🎯 **Complete API coverage** - All 31 resource endpoints with 100+ methods
- 🔐 **Webhook validation** - Built-in HMAC signature verification
- 📦 **520+ models** - Full type definitions for all API objects
- ⚡ **HTTP client included** - No external HTTP library needed (uses stdlib)
- 🛡️ **Error handling** - Proper exception hierarchy for API errors

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  polar-sh:
    github: qard/polar-sh
    version: ~> 0.1.0
```

Then run:

```bash
shards install
```

## Quick Start

```crystal
require "polar-sh"

# Initialize the client (uses POLAR_ACCESS_TOKEN env var)
client = Polar::Client.new

# Or explicitly provide credentials
client = Polar::Client.new(
  access_token: "your_access_token",
  server_url: "https://api.polar.sh"  # optional, defaults to production
)

# List organizations
response = client.organizations.list(limit: 10)

# Get a specific organization
org = client.organizations.get(id: "org_123")

# Create a product
product = client.products.create(body: product_data)
```

## Authentication

The SDK uses Bearer token authentication. You can create an access token in your [Polar.sh dashboard](https://polar.sh/settings/api).

```crystal
# Production environment (default)
client = Polar::Client.new(access_token: "your_access_token")

# Or explicitly specify production URL
client = Polar::Client.new(
  access_token: "your_access_token",
  server_url: "https://api.polar.sh"
)

# Sandbox environment (for testing)
client = Polar::Client.new(
  access_token: "your_sandbox_token",
  server_url: "https://sandbox-api.polar.sh"
)

# Or use environment variables
# Set POLAR_ACCESS_TOKEN and optionally POLAR_SERVER_URL
client = Polar::Client.new
```

## Usage Examples

### Fluent Nested API

The SDK uses a fluent, nested API structure that clearly separates different contexts:

```crystal
require "polar-sh"

client = Polar::Client.new(access_token: ENV["POLAR_ACCESS_TOKEN"])

# Organization/Admin operations (root level)
client.organizations.list(limit: 10)
client.products.create(body: product_data)
client.subscriptions.list(limit: 20)

# Customer Portal operations (customer-facing)
client.customer_portal.orders.list()
client.customer_portal.subscriptions.get(id: "sub_123")
client.customer_portal.benefit_grants.list()
client.customer_portal.customers.get  # Get authenticated customer
client.customer_portal.customers.list(page: 1, limit: 10)  # List payment methods

# OAuth2 operations
client.oauth2.clients.create(body: oauth_client_data)
client.oauth2.clients.get(client_id: "client_123")

# Webhook operations
client.webhooks.endpoints.list()
client.webhooks.endpoints.create(body: webhook_data)
```

### Creating a Product

```crystal
require "polar-sh"

client = Polar::Client.new(
  access_token: ENV["POLAR_ACCESS_TOKEN"]
)

# Note: Body parameters are JSON::Serializable objects
# You'll need to create a struct matching the API schema
response = client.products.create(body: product_data)
```

### Listing with Pagination

```crystal
# Get first page
page1 = client.organizations.list(page: 1, limit: 20)

# Get next page
page2 = client.organizations.list(page: 2, limit: 20)
```

### Error Handling

```crystal
begin
  org = client.organizations.get(id: "invalid_id")
rescue ex : Polar::ResourceNotFoundError
  puts "Organization not found (404)"
rescue ex : Polar::HTTPValidationError
  puts "Validation error (422): #{ex.message}"
rescue ex : Polar::NotPermittedError
  puts "Permission denied (403)"
rescue ex : Polar::PolarError
  puts "API error: #{ex.status_code} - #{ex.message}"
end
```

## Webhook Validation

Polar.sh uses the [Standard Webhooks](https://www.standardwebhooks.com/) specification for secure webhook delivery.

### Basic Usage

```crystal
require "polar-sh"

# In your web framework (Kemal, Lucky, etc.)
post "/webhooks/polar" do |env|
  # Get raw body and headers
  body = env.request.body.try(&.gets_to_end) || ""
  headers = env.request.headers

  begin
    # Validate and parse the webhook
    event = Polar::Webhooks.validate_event(
      body: body,
      headers: headers,
      secret: ENV["POLAR_WEBHOOK_SECRET"]  # Base64-encoded secret from Polar
    )

    # Process the event
    case event["type"].as_s
    when "subscription.created"
      handle_subscription_created(event)
    when "order.completed"
      handle_order_completed(event)
    end

    # Return 200 to acknowledge receipt
    env.response.status_code = 200
    "OK"
  rescue ex : Polar::WebhookVerificationError
    # Invalid signature - reject the webhook
    env.response.status_code = 403
    "Forbidden"
  end
end
```

### Webhook Security Features

- **HMAC-SHA256 signatures** - Cryptographic verification
- **Timestamp validation** - Prevents replay attacks (5-minute tolerance)
- **Constant-time comparison** - Prevents timing attacks
- **Base64 secret decoding** - Handles Polar's secret format

### Required Headers

The webhook must include these headers:
- `webhook-id` - Unique webhook identifier
- `webhook-timestamp` - Unix timestamp
- `webhook-signature` - HMAC signature(s)

## Configuration

### Server URLs

```crystal
# Production (default)
Polar::Client.new(access_token: token)
# Uses: https://api.polar.sh

# Sandbox
Polar::Client.new(
  access_token: token,
  server_url: "https://sandbox-api.polar.sh"
)

# Custom server (for local development)
Polar::Client.new(
  access_token: token,
  server_url: "http://localhost:8000"
)

# Using environment variable (recommended)
# Set POLAR_SERVER_URL=https://sandbox-api.polar.sh
Polar::Client.new(access_token: token)
```

### Timeouts

Currently uses Crystal's standard HTTP client defaults. Custom timeout configuration coming soon.

## Development

### Prerequisites

- Crystal >= 1.17.1
- OpenSSL (for webhook HMAC)

### Setup

```bash
# Clone the repository
git clone https://github.com/qard/polar-sh.git
cd polar-sh

# Install dependencies
shards install

# Run tests
crystal spec

# Format code
crystal tool format

# Build
crystal build src/polar-sh.cr
```

### Regenerating the SDK

The SDK is generated from Polar's OpenAPI specification using a custom generator.

**Automatic (via GitHub Actions):**

The SDK automatically regenerates daily when the Polar API changes:
- 🤖 Runs daily at 2 AM UTC
- 📥 Downloads latest OpenAPI spec from Polar API
- 🔄 Regenerates SDK
- ✅ Verifies build succeeds
- 📬 Creates PR if changes detected

**Manual regeneration:**

```bash
# Regenerate from production API (default)
crystal run src/generate.cr

# Or regenerate from sandbox API
crystal run src/generate.cr https://sandbox-api.polar.sh/openapi.json

# Format generated code
crystal tool format

# Verify build
crystal build src/polar-sh.cr
```

## Architecture

This SDK uses a **hybrid approach**:

1. **Generated Code** - API models and HTTP methods auto-generated from OpenAPI spec
2. **Custom Enhancements** - Webhook validation, error handling, and Crystal idioms

### Directory Structure

```
src/polar/
  client.cr              # Main client class
  errors.cr              # Exception hierarchy
  webhooks.cr            # Webhook validation
  models/                # 520+ generated models
  api/                   # 31 generated API clients

src/
  generator.cr     # Custom OpenAPI → Crystal generator

.github/workflows/
  ci.yml                 # Run tests on every PR
  regenerate-sdk.yml     # Auto-regenerate on API changes
  release.yml            # Create releases on version tags
```

## Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run `crystal tool format` and `crystal spec`
5. Submit a pull request

## Resources

- **Polar.sh Website:** https://polar.sh
- **API Documentation:** https://docs.polar.sh/api
- **OpenAPI Spec:** https://api.polar.sh/openapi.json
- **Standard Webhooks:** https://www.standardwebhooks.com/
- **Crystal Language:** https://crystal-lang.org/

## License

MIT License - see [LICENSE](./LICENSE) for details.

## Support

- **Issues:** [GitHub Issues](https://github.com/qard/polar-sh/issues)
- **Polar.sh Support:** https://polar.sh/support
- **Crystal Forum:** https://forum.crystal-lang.org/

---

Built with ❤️ using Crystal
