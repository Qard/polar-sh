# Polar.sh Crystal API Client

This is a Crystal language client for the Polar.sh API, generated from the official OpenAPI specification.

> **📋 Also see:** [`~/Code/crystal/CLAUDE.md`](../CLAUDE.md) for Crystal-specific development guidelines and [`~/Code/CLAUDE.md`](../../CLAUDE.md) for general coding practices.

## Project Overview

This SDK provides a complete, type-safe Crystal client for the Polar.sh API, supporting:
- All 24+ API resource namespaces (organizations, products, subscriptions, checkouts, etc.)
- Bearer token authentication
- Automatic pagination with Crystal iterators
- Webhook validation using Standard Webhooks specification
- Production and sandbox environment support
- Comprehensive error handling

## Architecture

### Generated Code vs Custom Code

This project uses a **hybrid approach**:

1. **Generated Code** (from OpenAPI spec):
   - API models and data structures
   - HTTP client operations
   - Request/response types
   - Located in: `src/polar/generated/`

2. **Custom Crystal Enhancements**:
   - Pagination helpers using `Iterator(T)` for lazy evaluation
   - Webhook HMAC signature validation
   - Idiomatic Crystal configuration
   - Enhanced error handling
   - Located in: `src/polar/` (top-level)

### Directory Structure

```
src/polar/
  client.cr              # Main Polar class
  config.cr              # Configuration struct
  errors.cr              # Custom exception hierarchy
  pagination.cr          # Pagination helpers
  webhooks.cr            # Webhook validation
  generated/             # OpenAPI-generated code
    models/              # Request/response models
    api/                 # API operation modules
spec/
  polar/
    pagination_spec.cr   # Pagination tests
    webhooks_spec.cr     # Webhook validation tests
    integration_spec.cr  # Integration tests
openapi/
  polar-api.json         # OpenAPI specification
.github/
  workflows/
    regenerate-sdk.yml   # Auto-regeneration workflow
```

## OpenAPI Code Generation

### SDK Generation

The SDK is generated from the official Polar.sh OpenAPI 3.1.0 specification using a **custom Crystal generator**.

**The generator automatically downloads the latest spec** from:
- Production: `https://api.polar.sh/openapi.json`
- Sandbox: `https://sandbox-api.polar.sh/openapi.json`

**Generate the SDK:**
```bash
# Use production API (default)
crystal run src/generate.cr

# Or use sandbox API
crystal run src/generate.cr https://sandbox-api.polar.sh/openapi.json
```

### Regeneration Workflow

When the Polar.sh API changes, the SDK should be regenerated:

1. **Automatic** (via GitHub Actions):
   - Runs daily at 2 AM UTC
   - Downloads latest spec and regenerates SDK
   - Compares generated code to current code
   - Creates PR if changes detected
   - Runs tests and formatting checks

2. **Manual**:
   ```bash
   # Regenerate SDK (downloads spec automatically)
   crystal run src/generate.cr

   # Format generated code
   crystal tool format

   # Verify build
   crystal build src/polar-sh.cr
   ```

### Post-Generation Steps

After regenerating, you may need to:
1. Review generated code changes
2. Update custom enhancements if needed (webhooks, pagination, etc.)
3. Add tests for new endpoints
4. Update documentation

## Development Workflow

### Setup

```bash
# Install dependencies
shards install

# Verify everything works
crystal spec
```

### Making Changes

1. **For new custom features**:
   - Add to `src/polar/` (not in `generated/`)
   - Write specs in `spec/polar/`
   - Update README with usage examples

2. **For API changes**:
   - Regenerate from updated OpenAPI spec
   - Don't manually edit generated code
   - Add custom wrappers if needed

### Testing

```bash
# Run all specs
crystal spec

# Run specific spec file
crystal spec spec/polar/webhooks_spec.cr

# Run with verbose output
crystal spec --verbose
```

**Integration Testing:**
- Use Polar's sandbox environment: `https://sandbox-api.polar.sh`
- Set `POLAR_ACCESS_TOKEN` environment variable
- Integration tests are in `spec/polar/integration_spec.cr`

### Code Quality

Before committing:

```bash
# Format code
crystal tool format

# Check formatting without modifying
crystal tool format --check

# Build to verify compilation
crystal build src/polar.cr

# Build release mode
crystal build --release src/polar.cr
```

## Key Features Implementation

### 1. Pagination

Paginated API responses implement Crystal's `Iterator(T)` for **lazy evaluation**:

```crystal
# List all organizations with automatic pagination
# Only fetches pages as needed - stops early if you break out of loop
client.organizations.list.each do |org|
  puts org.name
  break if some_condition  # Won't fetch unnecessary pages
end
```

**Implementation pattern:**
- Detect pagination from OpenAPI spec (page/limit parameters)
- Return `Iterator(T)` for paginated endpoints (not `Enumerable(T)`)
- Automatically fetch next pages lazily as iteration progresses
- Memory efficient - doesn't load all pages upfront
- Allows early termination without wasting API calls

### 2. Webhook Validation

Follows the [Standard Webhooks](https://www.standardwebhooks.com/) specification:

```crystal
# Validate webhook signature
event = Polar::Webhooks.validate_event(
  body: request.body,  # Raw request body
  headers: request.headers,
  secret: ENV["POLAR_WEBHOOK_SECRET"]  # Base64-encoded
)
```

**Implementation details:**
- HMAC-SHA256 signature verification
- Timestamp validation (tolerance: 5 minutes)
- Required headers: `webhook-id`, `webhook-timestamp`, `webhook-signature`
- Raises `Polar::WebhookVerificationError` on failure

### 3. Error Handling

Exception hierarchy mirrors the TypeScript SDK:

```crystal
begin
  org = client.organizations.get(id: "invalid")
rescue ex : Polar::HTTPValidationError
  # Handle validation errors (422)
  puts "Validation error: #{ex.message}"
rescue ex : Polar::ResourceNotFoundError
  # Handle not found (404)
  puts "Resource not found"
rescue ex : Polar::PolarError
  # Handle other API errors
  puts "API error: #{ex.status_code}"
end
```

### 4. Configuration

```crystal
polar = Polar::Client.new(
  access_token: ENV["POLAR_ACCESS_TOKEN"],
  server: :production,  # or :sandbox
  # Optional:
  timeout: 30.seconds,
  retry_config: Polar::RetryConfig.new(
    strategy: :backoff,
    initial_interval: 1.second,
    max_interval: 50.seconds,
    exponent: 1.1
  )
)
```

## Dependencies

Required shards (in `shard.yml`):
- Standard library HTTP client
- JSON parsing (built-in)
- OpenSSL for HMAC (built-in)

No external dependencies for core functionality.

## Common Tasks

### Adding a New Custom Feature

1. Create file in `src/polar/feature_name.cr`
2. Add module under `Polar` namespace
3. Write specs in `spec/polar/feature_name_spec.cr`
4. Document in README.md
5. Run `crystal spec` and `crystal tool format`

### Updating to New API Version

1. Download new OpenAPI spec
2. Run OpenAPI Generator
3. Review changes (git diff)
4. Update custom code if needed
5. Run full test suite
6. Update CHANGELOG

### Debugging API Calls

Enable HTTP logging (if implemented):

```crystal
Polar.configure do |config|
  config.debug = true  # Log all HTTP requests/responses
end
```

Or use Crystal's built-in logging with the HTTP client.

## Contribution Guidelines

When contributing to this project:

1. **Never modify generated code** directly - regenerate instead
2. **Always write tests** for new features
3. **Follow Crystal conventions** - see Crystal's style guide
4. **Update documentation** - README and doc comments
5. **Run quality checks** before committing:
   - `crystal tool format`
   - `crystal spec`
   - `crystal build --release`

## Resources

- **Polar.sh API Docs:** https://docs.polar.sh/api
- **OpenAPI Spec:** https://api.polar.sh/openapi.json
- **OpenAPI Generator:** https://openapi-generator.tech/
- **Standard Webhooks:** https://www.standardwebhooks.com/
- **Crystal Language:** https://crystal-lang.org/

## Troubleshooting

### OpenAPI Generator Issues

If generation fails:
- Ensure Java 11+ is installed
- Check OpenAPI spec is valid JSON
- Try updating openapi-generator to latest version

### Type Errors After Regeneration

If generated code has type errors:
- Check Crystal version compatibility
- Review OpenAPI Generator Crystal templates
- May need to manually adjust generated code (document in CLAUDE.md)

### Test Failures

- Verify `POLAR_ACCESS_TOKEN` is set for integration tests
- Check if using correct environment (sandbox vs production)
- Ensure test data is still valid
