#!/usr/bin/env crystal

# Crystal Code Generator for Polar.sh OpenAPI Specification
#
# This generator reads the Polar.sh OpenAPI spec and generates
# Crystal code with proper type safety, enums, union types, and generics.
#
# Features:
# - Proper enum generation with JSON serialization
# - Union types for oneOf/anyOf schemas
# - Type aliases for top-level $ref schemas
# - Generic types (ListResource, WebhookPayload, etc.)
# - Dependency-aware generation order
#
# Usage: crystal run src/generate.cr

require "json"
require "file_utils"
require "http/client"
require "ecr"

# Schema type classification
enum SchemaType
  Enum
  Object
  OneOf
  AnyOf
  AllOf
  Primitive
  Array
  Reference
end

module Polar
  # Main generator class
  class Generator
    VERSION = "2.0.0"

    POLAR_API_URL = "https://api.polar.sh/openapi.json"

    @spec : JSON::Any
    @output_dir : String

    # Schemas to skip (manually defined or using generics)
    SKIP_SCHEMAS = [
      "HTTPValidationError",
      "ResourceNotFound",
      "NotPermitted",
      "Unauthorized",
      "BenefitGrantWebhook",
      "SystemEvent",
      "WebhookPayload",
    ]

    def initialize(spec_url : String = POLAR_API_URL, output_dir : String = "src/polar")
      puts "📥 Downloading OpenAPI spec from #{spec_url}..."
      @spec = fetch_spec(spec_url)
      @output_dir = output_dir
    end

    private def fetch_spec(url : String) : JSON::Any
      response = HTTP::Client.get(url)

      unless response.success?
        raise "Failed to download OpenAPI spec: HTTP #{response.status_code}"
      end

      JSON.parse(response.body)
    end

    def generate!
      puts "🔧 Polar.sh Crystal SDK Generator v#{VERSION}"
      puts "📄 Reading OpenAPI spec..."

      # Clean up existing generated directories
      puts "🧹 Cleaning up existing generated files..."
      FileUtils.rm_rf("#{@output_dir}/models") if Dir.exists?("#{@output_dir}/models")
      FileUtils.rm_rf("#{@output_dir}/api") if Dir.exists?("#{@output_dir}/api")
      FileUtils.rm_rf("spec/polar/api") if Dir.exists?("spec/polar/api")

      # Create output directories
      FileUtils.mkdir_p("#{@output_dir}/models")
      FileUtils.mkdir_p("#{@output_dir}/api")
      FileUtils.mkdir_p("spec/polar/api")

      # Generate generic types
      generate_generic_types

      # Extract and generate inline union types
      generate_inline_unions

      # Generate models from schemas
      generate_models

      # Generate API clients and tests from paths
      generate_api_clients

      # Format generated code
      format_generated_code

      puts "✅ Generation complete!"
    end

    private def format_generated_code
      puts "🎨 Formatting generated code..."
      system("crystal tool format #{@output_dir}")
      system("crystal tool format spec/polar")
    end

    private def generate_models
      puts "📦 Generating models..."

      schemas = @spec["components"]["schemas"].as_h
      generated_count = 0
      enum_count = 0
      union_count = 0
      alias_count = 0

      schemas.each do |name, schema|
        # Skip patterns
        next if should_skip_schema?(name)

        # Classify schema type
        schema_type = classify_schema(schema)

        case schema_type
        when SchemaType::Enum
          generate_enum(name, schema)
          enum_count += 1
          generated_count += 1
        when SchemaType::OneOf, SchemaType::AnyOf
          generate_union(name, schema, schema_type)
          union_count += 1
          generated_count += 1
        when SchemaType::Reference
          generate_type_alias(name, schema)
          alias_count += 1
          generated_count += 1
        when SchemaType::Object
          generate_object(name, schema)
          generated_count += 1
        end
      end

      puts "   Generated #{generated_count} models (#{enum_count} enums, #{union_count} unions, #{alias_count} aliases)"
    end

    private def should_skip_schema?(name : String) : Bool
      # Check explicit skip list
      return true if SKIP_SCHEMAS.includes?(name)

      # Skip ListResource_*_ - we use a generic ListResource(T) instead
      return true if name.starts_with?("ListResource_")

      # Skip Webhook*Payload - we use a generic WebhookPayload(T) instead
      return true if name.starts_with?("Webhook") && name.ends_with?("Payload")

      # Skip *Event patterns (system events) - we use a generic SystemEvent(M) instead
      # But exclude Event (union type), UserEvent and WebhookEvent which are different
      if name.ends_with?("Event") && !["Event", "UserEvent", "WebhookEvent"].includes?(name)
        return true
      end

      # Skip BenefitGrant*Webhook - we use a generic BenefitGrantWebhook(B, P) instead
      return true if name.starts_with?("BenefitGrant") && name.ends_with?("Webhook")

      false
    end

    private def classify_schema(schema : JSON::Any) : SchemaType
      # Check for top-level $ref (type alias)
      return SchemaType::Reference if schema["$ref"]?

      # Check for enum
      return SchemaType::Enum if schema["enum"]?

      # Check for composition keywords
      return SchemaType::OneOf if schema["oneOf"]?
      return SchemaType::AnyOf if schema["anyOf"]?
      return SchemaType::AllOf if schema["allOf"]?

      # Check for array
      return SchemaType::Array if schema["type"]? == "array"

      # Check for object or primitive
      if schema["type"]? == "object" || schema["properties"]?
        SchemaType::Object
      else
        SchemaType::Primitive
      end
    end

    private def generate_enum(name : String, schema : JSON::Any)
      class_name = to_class_name(name)
      file_name = to_snake_case(name)
      description = schema["description"]?.try(&.as_s).try { |d| sanitize_description(d) } || ""
      values = schema["enum"].as_a.map(&.as_s)

      content = String.build do |io|
        io << "# #{class_name}\n"
        io << "#\n"
        unless description.empty?
          description.lines.each do |line|
            io << "# #{line}\n"
          end
          io << "#\n"
        end
        io << "# Auto-generated from OpenAPI spec\n"
        io << "module Polar\n"
        io << "  module Models\n"
        io << "    enum #{class_name}\n"

        values.each do |value|
          # Handle negative prefix (for sort properties)
          is_negative = value.starts_with?("-")
          clean_value = is_negative ? value[1..] : value

          # Convert snake_case to PascalCase for enum members
          member_name = clean_value.split('_').map(&.capitalize).join

          # Add Neg prefix for negative values
          member_name = "Neg" + member_name if is_negative

          # Handle special cases
          member_name = member_name.gsub(/[^a-zA-Z0-9_]/, "")
          member_name = "Value" + member_name if member_name[0]?.try(&.to_i?)

          io << "      #{member_name}\n"
        end

        io << "\n"
        io << "      # Serialize to JSON using snake_case string values\n"
        io << "      def to_json(json : JSON::Builder)\n"
        io << "        str = to_s.underscore\n"
        io << "        # Handle Neg prefix (convert back to - prefix)\n"
        io << "        str = \"-\" + str[4..] if str.starts_with?(\"neg_\")\n"
        io << "        json.string(str)\n"
        io << "      end\n\n"
        io << "      # Deserialize from JSON\n"
        io << "      def self.from_json(parser : JSON::PullParser) : self\n"
        io << "        value = parser.read_string\n"
        io << "        # Handle negative prefix\n"
        io << "        is_negative = value.starts_with?(\"-\")\n"
        io << "        clean_value = is_negative ? value[1..] : value\n"
        io << "        member_name = clean_value.split('_').map(&.capitalize).join\n"
        io << "        member_name = \"Neg\" + member_name if is_negative\n"
        io << "        parse(member_name)\n"
        io << "      end\n"
        io << "    end\n"
        io << "  end\n"
        io << "end\n"
      end

      File.write("#{@output_dir}/models/#{file_name}.cr", content)
    end

    private def generate_union(name : String, schema : JSON::Any, schema_type : SchemaType)
      class_name = to_class_name(name)
      file_name = to_snake_case(name)
      description = schema["description"]?.try(&.as_s).try { |d| sanitize_description(d) }

      # Extract refs from oneOf or anyOf
      refs = if schema_type == SchemaType::OneOf
               schema["oneOf"].as_a.compact_map { |s| extract_ref_name(s) }
             else
               schema["anyOf"].as_a.compact_map { |s| extract_ref_name(s) }
             end

      return if refs.empty?

      content = String.build do |io|
        io << "# #{class_name}\n"
        io << "#\n"
        if description
          description.lines.each do |line|
            io << "# #{line}\n"
          end
          io << "#\n"
        end
        io << "# Union type (#{schema_type == SchemaType::OneOf ? "oneOf" : "anyOf"})\n"
        io << "# Auto-generated from OpenAPI spec\n"
        io << "module Polar\n"
        io << "  module Models\n"

        # Generate union type alias
        # All types are in Models namespace, so use unqualified names
        union_types = refs.map { |ref| to_class_name(ref) }.join(" | ")
        io << "    alias #{class_name} = #{union_types}\n"

        io << "  end\n"
        io << "end\n"
      end

      File.write("#{@output_dir}/models/#{file_name}.cr", content)
    end

    private def generate_type_alias(name : String, schema : JSON::Any)
      class_name = to_class_name(name)
      file_name = to_snake_case(name)

      ref_name = extract_ref_name(schema)
      return unless ref_name

      target_class = to_class_name(ref_name)

      content = String.build do |io|
        io << "# #{class_name}\n"
        io << "#\n"
        io << "# Type alias\n"
        io << "# Auto-generated from OpenAPI spec\n"
        io << "module Polar\n"
        io << "  module Models\n"
        # All types are in Models namespace, so use unqualified name
        io << "    alias #{class_name} = #{target_class}\n"
        io << "  end\n"
        io << "end\n"
      end

      File.write("#{@output_dir}/models/#{file_name}.cr", content)
    end

    private def extract_ref_name(schema : JSON::Any) : String?
      if ref = schema["$ref"]?
        ref.as_s.sub("#/components/schemas/", "")
      end
    end

    # Generic types that live in root Polar module, not Polar::Models
    GENERIC_TYPES = [
      "SystemEvent",
      "BenefitGrantWebhook",
      "ListResource",
      "WebhookPayload",
    ]

    # Check if a type name is a union or type alias (lives in root Polar module)
    private def union_or_alias_type?(type_name : String) : Bool
      schemas = @spec["components"]["schemas"].as_h
      return false unless schemas.has_key?(type_name)

      schema = schemas[type_name]
      # Check if it's a union (oneOf/anyOf) or type alias (simple $ref)
      !!(schema["oneOf"]? || schema["anyOf"]? || (schema["$ref"]? && !schema["properties"]?))
    end

    # Check if a type name is a generic type (lives in root Polar module)
    private def generic_type?(type_name : String) : Bool
      GENERIC_TYPES.includes?(type_name)
    end

    # Check if type lives in root Polar module (generic, union, or alias)
    private def root_polar_type?(type_name : String) : Bool
      generic_type?(type_name) || union_or_alias_type?(type_name)
    end

    private def generate_generic_types
      puts "🔀 Generating generic types..."

      schemas = @spec["components"]["schemas"].as_h
      generics_generated = 0

      # Check if we need to generate each generic type
      needs_list_resource = schemas.any? { |name, _| name.starts_with?("ListResource_") }
      needs_system_event = schemas.any? { |name, _| name.ends_with?("Event") && !["UserEvent", "WebhookEvent"].includes?(name) && !name.starts_with?("ListResource_") }
      needs_benefit_grant_webhook = schemas.any? { |name, _| name.starts_with?("BenefitGrant") && name.ends_with?("Webhook") }
      needs_webhook_payload = schemas.any? { |name, _| name.starts_with?("Webhook") && name.ends_with?("Payload") }

      if needs_list_resource
        generate_list_resource_generic
        generics_generated += 1
      end

      if needs_system_event
        generate_system_event_generic(schemas)
        generics_generated += 1
      end

      if needs_benefit_grant_webhook
        generate_benefit_grant_webhook_generic(schemas)
        generics_generated += 1
      end

      if needs_webhook_payload
        generate_webhook_payload_generic(schemas)
        generics_generated += 1
      end

      puts "   Generated #{generics_generated} generic types"
    end

    private def generate_list_resource_generic
      content = <<-CRYSTAL
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
    # puts "Page \#{result.pagination.page} of \#{result.pagination.max_page}"
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
    CRYSTAL

      File.write("#{@output_dir}/models/list_resource.cr", content)
    end

    private def generate_system_event_generic(schemas : Hash(String, JSON::Any))
      # Get a sample system event to extract the common structure
      sample_event = schemas.find { |name, _| name.ends_with?("Event") && name.includes?("Created") }
      return unless sample_event

      event_schema = sample_event[1]
      properties = event_schema["properties"]?.try(&.as_h) || {} of String => JSON::Any

      content = <<-CRYSTAL
    # SystemEvent
    #
    # System event structure for Polar.sh events.
    #
    # System events are created by Polar for various actions in the platform.
    # All system events share this common structure with event-specific metadata.
    #
    # ## Usage
    #
    # ```
    # # Parse a system event
    # event = Polar::SystemEvent.from_json(json)
    # puts "Event ID: \#{event.id}"
    # puts "Event name: \#{event.name}"
    # puts "Metadata: \#{event.metadata}"
    # ```
    #
    # Auto-generated from OpenAPI spec

    module Polar
      module Models
        # System event
        struct SystemEvent
          include JSON::Serializable

          # The ID of the object
          @[JSON::Field(key: "id")]
          getter id : String

          # The timestamp of the event
          @[JSON::Field(key: "timestamp")]
          getter timestamp : Time

          # The ID of the organization owning the event
          @[JSON::Field(key: "organization_id")]
          getter organization_id : String

          # ID of the customer in your Polar organization associated with the event
          @[JSON::Field(key: "customer_id")]
          getter customer_id : JSON::Any

          # The customer associated with the event
          @[JSON::Field(key: "customer")]
          getter customer : JSON::Any

          # ID of the customer in your system associated with the event
          @[JSON::Field(key: "external_customer_id")]
          getter external_customer_id : JSON::Any

          # The source of the event (system or user)
          @[JSON::Field(key: "source")]
          getter source : String

          # The name of the event
          @[JSON::Field(key: "name")]
          getter name : String

          # Event-specific metadata
          @[JSON::Field(key: "metadata")]
          getter metadata : JSON::Any
        end
      end
    end
    CRYSTAL

      File.write("#{@output_dir}/models/system_event.cr", content)
    end

    private def generate_benefit_grant_webhook_generic(schemas : Hash(String, JSON::Any))
      # Get a sample benefit grant webhook to extract the common structure
      sample_webhook = schemas.find { |name, _| name.starts_with?("BenefitGrant") && name.ends_with?("Webhook") && name != "BenefitGrantWebhook" }
      return unless sample_webhook

      webhook_schema = sample_webhook[1]
      properties = webhook_schema["properties"]?.try(&.as_h) || {} of String => JSON::Any

      content = <<-CRYSTAL
    # BenefitGrantWebhook(B, P)
    #
    # Generic benefit grant webhook structure for Polar.sh webhook events.
    #
    # Benefit grants represent the assignment of a benefit to a customer.
    # This generic type allows different benefit types and their associated
    # properties to be represented with type safety.
    #
    # ## Usage
    #
    # ```
    # # Parse a custom benefit grant webhook
    # grant = Polar::BenefitGrantWebhook(Polar::BenefitCustom, Polar::BenefitGrantCustomProperties).from_json(json)
    # puts "Grant ID: \#{grant.id}"
    # puts "Benefit: \#{grant.benefit}"
    # ```
    #
    # Auto-generated from OpenAPI spec

    module Polar
      # Generic benefit grant webhook payload
      #
      # @param B The type of benefit
      # @param P The type of grant properties
      struct BenefitGrantWebhook(B, P)
        include JSON::Serializable

        # Creation timestamp of the object
        @[JSON::Field(key: "created_at")]
        getter created_at : Time

        # Last modification timestamp of the object
        @[JSON::Field(key: "modified_at")]
        getter modified_at : JSON::Any

        # The ID of the grant
        @[JSON::Field(key: "id")]
        getter id : String

        # The timestamp when the benefit was granted
        @[JSON::Field(key: "granted_at")]
        getter granted_at : JSON::Any?

        # Whether the benefit is granted
        @[JSON::Field(key: "is_granted")]
        getter is_granted : Bool

        # The timestamp when the benefit was revoked
        @[JSON::Field(key: "revoked_at")]
        getter revoked_at : JSON::Any?

        # Whether the benefit is revoked
        @[JSON::Field(key: "is_revoked")]
        getter is_revoked : Bool

        # The ID of the subscription that granted this benefit
        @[JSON::Field(key: "subscription_id")]
        getter subscription_id : JSON::Any

        # The ID of the order that granted this benefit
        @[JSON::Field(key: "order_id")]
        getter order_id : JSON::Any

        # The ID of the customer concerned by this grant
        @[JSON::Field(key: "customer_id")]
        getter customer_id : String

        # The ID of the benefit concerned by this grant
        @[JSON::Field(key: "benefit_id")]
        getter benefit_id : String

        # Error information if the benefit grant failed
        @[JSON::Field(key: "error")]
        getter error : JSON::Any?

        # The customer receiving the benefit
        @[JSON::Field(key: "customer")]
        getter customer : Models::Customer

        # The benefit being granted
        @[JSON::Field(key: "benefit")]
        getter benefit : B

        # Type-specific grant properties
        @[JSON::Field(key: "properties")]
        getter properties : P

        # Previous properties (for update events)
        @[JSON::Field(key: "previous_properties")]
        getter previous_properties : JSON::Any?
      end
    end
    CRYSTAL

      File.write("#{@output_dir}/models/benefit_grant_webhook.cr", content)
    end

    private def generate_webhook_payload_generic(schemas : Hash(String, JSON::Any))
      # WebhookPayload might not have instances in the current spec, but we'll generate it anyway
      content = <<-CRYSTAL
    # WebhookPayload(T)
    #
    # Generic webhook payload structure for Polar.sh webhook events.
    #
    # All webhook events share this common structure with a type identifier,
    # timestamp, and typed data payload.
    #
    # ## Usage
    #
    # ```
    # # Parse a webhook with organization data
    # payload = Polar::WebhookPayload(Polar::Organization).from_json(json)
    # puts "Event type: \#{payload.type}"
    # puts "Organization: \#{payload.data.name}"
    # ```
    #
    # Auto-generated from OpenAPI spec

    module Polar
      # Generic webhook event payload
      #
      # @param T The type of data in the webhook payload
      struct WebhookPayload(T)
        include JSON::Serializable

        # The webhook event type identifier
        @[JSON::Field(key: "type")]
        getter type : String

        # When the webhook event occurred
        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time

        # The event data payload
        @[JSON::Field(key: "data")]
        getter data : T
      end
    end
    CRYSTAL

      File.write("#{@output_dir}/models/webhook_payload.cr", content)
    end

    private def generate_inline_unions
      puts "🔍 Extracting inline union types..."

      schemas = @spec["components"]["schemas"].as_h
      inline_unions = {} of String => Array(String)

      # Scan all schemas for inline oneOf/anyOf with titles
      schemas.each do |name, schema|
        scan_for_inline_unions(schema, inline_unions)
      end

      # Generate the extracted inline unions
      inline_unions.each do |union_name, refs|
        content = String.build do |io|
          io << "# #{union_name}\n"
          io << "#\n"
          io << "# Inline union type extracted from OpenAPI spec\n"
          io << "# Auto-generated from OpenAPI spec\n"
          io << "module Polar\n"
          io << "  module Models\n"

          # All types are in Models namespace, so use unqualified names
          union_types = refs.map { |ref| to_class_name(ref) }.join(" | ")
          io << "    alias #{union_name} = #{union_types}\n"

          io << "  end\n"
          io << "end\n"
        end

        file_name = to_snake_case(union_name)
        File.write("#{@output_dir}/models/#{file_name}.cr", content)
      end

      puts "   Extracted #{inline_unions.size} inline union types" unless inline_unions.empty?
    end

    private def scan_for_inline_unions(value : JSON::Any, result : Hash(String, Array(String)))
      case value.raw
      when Hash
        hash = value.as_h

        # Check if this is a oneOf/anyOf with a title
        if (hash["oneOf"]? || hash["anyOf"]?) && (title = hash["title"]?.try(&.as_s))
          # Extract refs from oneOf or anyOf
          refs = if hash["oneOf"]?
                   hash["oneOf"].as_a.compact_map { |s| extract_ref_name(s) }
                 else
                   hash["anyOf"].as_a.compact_map { |s| extract_ref_name(s) }
                 end

          result[title] = refs unless refs.empty?
        end

        # Recursively scan all values
        hash.each_value { |v| scan_for_inline_unions(v, result) }
      when Array
        value.as_a.each { |v| scan_for_inline_unions(v, result) }
      end
    end

    private def generate_object(name : String, schema : JSON::Any)
      # Convert OpenAPI schema name to Crystal class name
      class_name = to_class_name(name)
      file_name = to_snake_case(name)
      description = schema["description"]?.try(&.as_s).try { |d| sanitize_description(d) }

      # Extract properties with their metadata
      properties = [] of Tuple(String, String, Bool, String)
      if props = schema["properties"]?.try &.as_h
        required_props = schema["required"]?.try(&.as_a.map(&.as_s)) || [] of String
        props.each do |prop_name, prop_schema|
          crystal_type = map_type(prop_schema)
          is_required = required_props.includes?(prop_name)
          prop_description = prop_schema["description"]?.try(&.as_s).try { |d| sanitize_description(d) } || ""
          properties << {prop_name, crystal_type, is_required, prop_description}
        end
      end

      content = ECR.render("templates/model.ecr")
      File.write("#{@output_dir}/models/#{file_name}.cr", content)
    end

    private def map_type(schema : JSON::Any) : String
      # Handle $ref first
      if ref = schema["$ref"]?.try(&.as_s)
        ref_name = ref.split("/").last
        return to_class_name(ref_name)
      end

      # Handle oneOf, anyOf, allOf - use JSON::Any for now
      return "JSON::Any" if schema["oneOf"]? || schema["anyOf"]? || schema["allOf"]?

      type = schema["type"]?.try(&.as_s)

      case type
      when "string"
        case schema["format"]?.try(&.as_s)
        when "date-time" then "Time"
        when "date"      then "Time"
        when "uuid"      then "String"
        else                  "String"
        end
      when "integer"
        case schema["format"]?.try(&.as_s)
        when "int32" then "Int32"
        when "int64" then "Int64"
        else              "Int64"
        end
      when "number"
        case schema["format"]?.try(&.as_s)
        when "float"  then "Float32"
        when "double" then "Float64"
        else               "Float64"
        end
      when "boolean"
        "Bool"
      when "array"
        if items = schema["items"]?
          "Array(#{map_type(items)})"
        else
          "Array(JSON::Any)"
        end
      when "object"
        if additional = schema["additionalProperties"]?
          if additional.as_bool? == true
            "Hash(String, JSON::Any)"
          else
            "Hash(String, #{map_type(additional)})"
          end
        else
          "Hash(String, JSON::Any)"
        end
      when "null"
        "Nil"
      else
        "JSON::Any"
      end
    end

    private def generate_api_clients
      puts "🔌 Generating API clients and tests..."

      # Collect all operations with their contexts
      all_operations = [] of Tuple(String, String, JSON::Any, OperationContext)

      @spec["paths"].as_h.each do |path, path_item|
        path_item.as_h.each do |method, operation|
          next unless method.in?(["get", "post", "put", "patch", "delete"])
          next unless operation.is_a?(JSON::Any)

          operation_id = operation["operationId"]?.try(&.as_s)
          next unless operation_id

          context = parse_operation_context(operation_id)
          all_operations << {path, method, operation, context}
        end
      end

      # Group operations by namespace and resource
      root_operations = Hash(String, Array(Tuple(String, String, JSON::Any))).new { |h, k| h[k] = [] of Tuple(String, String, JSON::Any) }
      customer_portal_operations = Hash(String, Array(Tuple(String, String, JSON::Any))).new { |h, k| h[k] = [] of Tuple(String, String, JSON::Any) }
      oauth2_operations = Hash(String, Array(Tuple(String, String, JSON::Any))).new { |h, k| h[k] = [] of Tuple(String, String, JSON::Any) }
      webhooks_operations = Hash(String, Array(Tuple(String, String, JSON::Any))).new { |h, k| h[k] = [] of Tuple(String, String, JSON::Any) }

      all_operations.each do |path, method, operation, context|
        case context.namespace
        when "customer_portal"
          customer_portal_operations[context.resource] << {path, method, operation}
        when "oauth2"
          oauth2_operations[context.resource] << {path, method, operation}
        when "webhooks"
          webhooks_operations[context.resource] << {path, method, operation}
        else
          root_operations[context.resource] << {path, method, operation}
        end
      end

      # Generate root-level API clients (only those without customer_portal_* duplicates)
      root_operations.each do |resource, operations|
        generate_api_client(resource, operations)
        generate_api_spec(resource, operations)
      end

      # Generate CustomerPortal namespace with nested resources
      unless customer_portal_operations.empty?
        generate_namespace_api("customer_portal", customer_portal_operations)
      end

      # Generate OAuth2 namespace with nested resources
      unless oauth2_operations.empty?
        generate_namespace_api("oauth2", oauth2_operations)
      end

      # Generate Webhooks namespace with nested resources
      unless webhooks_operations.empty?
        generate_namespace_api("webhooks", webhooks_operations)
      end

      total_clients = root_operations.size +
                      (customer_portal_operations.empty? ? 0 : 1) +
                      (oauth2_operations.empty? ? 0 : 1) +
                      (webhooks_operations.empty? ? 0 : 1)

      puts "   Generated #{total_clients} API clients with tests"

      {root_operations, customer_portal_operations, oauth2_operations, webhooks_operations}
    end

    private def generate_api_client(tag : String, operations : Array(Tuple(String, String, JSON::Any)))
      class_name = to_class_name(tag)
      file_name = to_snake_case(tag)
      accessor_name = to_snake_case(tag)

      content = ECR.render("templates/api_client.ecr")
      File.write("#{@output_dir}/api/#{file_name}.cr", content)
    end

    private def generate_api_spec(tag : String, operations : Array(Tuple(String, String, JSON::Any)))
      class_name = to_class_name(tag)
      file_name = to_snake_case(tag)
      accessor_name = to_snake_case(tag)

      content = ECR.render("templates/api_spec.ecr")
      File.write("spec/polar/api/#{file_name}_spec.cr", content)
    end

    # Generate a namespace API (e.g., CustomerPortal, OAuth2, Webhooks) with nested resource classes
    private def generate_namespace_api(namespace : String, resources : Hash(String, Array(Tuple(String, String, JSON::Any))))
      namespace_class = to_class_name(namespace)
      namespace_file = to_snake_case(namespace)

      # Create the namespace file with nested resource classes
      File.open("#{@output_dir}/api/#{namespace_file}.cr", "w") do |file|
        file.puts "# #{namespace_class}"
        file.puts "#"
        file.puts "# API client for #{namespace} resource operations."
        file.puts "#"
        file.puts "# Auto-generated from OpenAPI spec"
        file.puts "module Polar"
        file.puts "  module Api"
        file.puts "    # #{namespace_class} namespace for #{namespace} operations"
        file.puts "    module #{namespace_class}"
        file.puts ""

        # Generate nested resource classes
        resources.each do |resource, operations|
          resource_class = to_class_name(resource)

          file.puts "      # API client for #{resource} operations in #{namespace} context"
          file.puts "      class #{resource_class}"
          file.puts "        Log = ::Log.for(self)"
          file.puts ""
          file.puts "        # Creates a new #{resource_class} instance"
          file.puts "        #"
          file.puts "        # @param client [Client] The Polar API client instance"
          file.puts "        def initialize(@client : Client)"
          file.puts "          Log.debug { \"Initialized #{namespace_class}::#{resource_class} API client\" }"
          file.puts "        end"
          file.puts ""

          # Generate methods for this resource
          operations.each do |(path, http_method, operation)|
            generate_nested_method(file, path, http_method, operation, namespace, resource, 8)
          end

          file.puts "      end"
          file.puts ""
        end

        # Generate main namespace class with resource accessors
        file.puts "      # Main #{namespace_class} class with resource accessors"
        file.puts "      class Base"
        file.puts "        def initialize(@client : Client)"
        file.puts "        end"
        file.puts ""

        # Generate accessor methods for each resource
        resources.each_key do |resource|
          resource_accessor = to_snake_case(resource)
          resource_class = to_class_name(resource)
          file.puts "        # Access #{resource} operations"
          file.puts "        def #{resource_accessor} : #{resource_class}"
          file.puts "          #{resource_class}.new(@client)"
          file.puts "        end"
          file.puts ""
        end

        file.puts "      end"
        file.puts "    end"
        file.puts "  end"
        file.puts ""

        # Generate Client accessor for the namespace
        file.puts "  # Extend Client class with #{namespace} API accessor"
        file.puts "  class Client"
        file.puts "    # Access the #{namespace} API"
        file.puts "    #"
        file.puts "    # @return [Api::#{namespace_class}::Base] The #{namespace} API client"
        file.puts "    def #{namespace_file} : Api::#{namespace_class}::Base"
        file.puts "      Api::#{namespace_class}::Base.new(self)"
        file.puts "    end"
        file.puts "  end"
        file.puts "end"
      end

      # Generate test spec
      File.open("spec/polar/api/#{namespace_file}_spec.cr", "w") do |file|
        file.puts "require \"../../spec_helper\""
        file.puts ""
        file.puts "describe Polar::Api::#{namespace_class} do"
        file.puts "  it \"has namespace accessor on client\" do"
        file.puts "    client = Polar::Client.new"
        file.puts "    client.#{namespace_file}.should be_a(Polar::Api::#{namespace_class}::Base)"
        file.puts "  end"
        file.puts ""

        resources.each_with_index do |(resource, operations), index|
          resource_accessor = to_snake_case(resource)
          resource_class = to_class_name(resource)

          file.puts "" if index > 0
          file.puts "  describe Polar::Api::#{namespace_class}::#{resource_class} do"
          file.puts "    it \"has accessor method on namespace\" do"
          file.puts "      client = Polar::Client.new"
          file.puts "      client.#{namespace_file}.#{resource_accessor}.should be_a(Polar::Api::#{namespace_class}::#{resource_class})"
          file.puts "    end"
          file.puts "  end"
        end

        file.puts "end"
      end
    end

    # Generate a method within a nested class
    private def generate_nested_method(file : File, path : String, http_method : String, operation : JSON::Any, namespace : String, resource : String, indent : Int32)
      operation_id = operation["operationId"]?.try(&.as_s) || "unknown"
      context = parse_operation_context(operation_id)
      method_name = context.operation

      summary = operation["summary"]?.try(&.as_s)
      description = operation["description"]?.try(&.as_s)

      params = operation["parameters"]?.try(&.as_a) || [] of JSON::Any
      path_params = params.select { |p| p["in"]?.try(&.as_s) == "path" }
      query_params = params.select { |p| p["in"]?.try(&.as_s) == "query" }
      request_body = operation["requestBody"]?

      # Build method parameters
      required_params = [] of String
      optional_params = [] of String

      path_params.each do |param|
        param_name = param["name"].as_s
        param_type = map_param_type(param["schema"]?)
        required = param["required"]?.try(&.as_bool) || false
        if required
          required_params << "#{to_snake_case(param_name)} : #{param_type}"
        else
          optional_params << "#{to_snake_case(param_name)} : #{param_type}? = nil"
        end
      end

      query_params.each do |param|
        param_name = param["name"].as_s
        param_type = map_param_type(param["schema"]?)
        required = param["required"]?.try(&.as_bool) || false
        if required
          required_params << "#{to_snake_case(param_name)} : #{param_type}"
        else
          optional_params << "#{to_snake_case(param_name)} : #{param_type}? = nil"
        end
      end

      # Get request and response types
      request_body_type = get_request_body_type(operation)
      response_type = get_response_type(operation)

      if request_body
        body_type = request_body_type || "JSON::Serializable"
        required_params << "body : #{body_type}"
      end

      method_params = required_params + optional_params

      # Build URL with path parameters
      url_builder = path.dup
      path_params.each do |param|
        param_name = param["name"].as_s
        url_builder = url_builder.gsub("{#{param_name}}", "\#{#{to_snake_case(param_name)}}")
      end

      spaces = " " * indent
      file.puts "#{spaces}# #{sanitize_description(summary) if summary}"
      file.puts "#{spaces}#"
      if description && description != summary
        sanitize_description(description).lines.each do |line|
          file.puts line.empty? ? "#{spaces}#" : "#{spaces}# #{line}"
        end
        file.puts "#{spaces}#"
      end
      file.puts "#{spaces}# **Endpoint:** `#{http_method.upcase} #{path}`"
      file.puts "#{spaces}#"
      unless path_params.empty? && query_params.empty? && request_body.nil?
        file.puts "#{spaces}# **Parameters:**"
        path_params.each do |param|
          param_name = to_snake_case(param["name"].as_s)
          param_desc = sanitize_description(param["description"]?.try(&.as_s) || "Path parameter")
          param_required = param["required"]?.try(&.as_bool) || false
          file.puts "#{spaces}# - `#{param_name}` (#{param_required ? "required" : "optional"}): #{param_desc}"
        end
        query_params.each do |param|
          param_name = to_snake_case(param["name"].as_s)
          param_desc = sanitize_description(param["description"]?.try(&.as_s) || "Query parameter")
          param_required = param["required"]?.try(&.as_bool) || false
          file.puts "#{spaces}# - `#{param_name}` (#{param_required ? "required" : "optional"}): #{param_desc}"
        end
        if request_body
          file.puts "#{spaces}# - `body` (required): Request body#{" as #{request_body_type}" if request_body_type}"
        end
        file.puts "#{spaces}#"
      end
      file.puts "#{spaces}# **Returns:**#{" #{response_type}" if response_type}#{" JSON response string" unless response_type}"
      file.puts "#{spaces}#"
      file.puts "#{spaces}# **Raises:**"
      file.puts "#{spaces}# - `ResourceNotFoundError` on 404"
      file.puts "#{spaces}# - `NotPermittedError` on 403"
      file.puts "#{spaces}# - `HTTPValidationError` on 422"
      file.puts "#{spaces}# - `PolarError` on other errors"
      file.puts "#{spaces}def #{method_name}#{unless method_params.empty?
                                                "(#{method_params.join(", ")})"
                                              end}#{" : #{response_type}" if response_type}"
      file.puts "#{spaces}  Log.debug { \"Calling #{method_name}\" }"
      file.puts "#{spaces}  url = \"#{url_builder}\""
      unless query_params.empty?
        file.puts "#{spaces}  query_params = {} of String => String"
        query_params.each do |param|
          param_name = to_snake_case(param["name"].as_s)
          file.puts "#{spaces}  query_params[\"#{param["name"].as_s}\"] = #{param_name}.to_s if #{param_name}"
        end
        file.puts "#{spaces}  url += \"?\" + HTTP::Params.encode(query_params) unless query_params.empty?"
        file.puts "#{spaces}  Log.trace { \"Query params: \#{query_params}\" }"
      end
      file.puts "#{spaces}  response = @client.request(\"#{http_method.upcase}\", url#{", body: body.to_json" if request_body})"
      if response_type
        file.puts "#{spaces}  result = #{response_type}.from_json(response)"
        file.puts "#{spaces}  Log.debug { \"#{method_name} completed successfully\" }"
        file.puts "#{spaces}  result"
      else
        file.puts "#{spaces}  Log.debug { \"#{method_name} completed successfully\" }"
        file.puts "#{spaces}  response"
      end
      file.puts "#{spaces}end"
      file.puts ""
    end

    private def map_param_type(schema : JSON::Any?) : String
      return "String" unless schema

      type = schema["type"]?.try(&.as_s)
      case type
      when "string"  then "String"
      when "integer" then "Int32"
      when "number"  then "Float64"
      when "boolean" then "Bool"
      else                "String"
      end
    end

    # Extract response type from operation responses
    private def get_response_type(operation : JSON::Any) : String?
      responses = operation["responses"]?
      return nil unless responses

      # Try 200, 201, or 204 status codes
      ["200", "201", "204"].each do |status|
        response = responses[status]?
        next unless response

        content = response["content"]?
        next unless content

        json_content = content["application/json"]?
        next unless json_content

        schema = json_content["schema"]?
        next unless schema

        return extract_type_from_schema(schema)
      end

      nil
    end

    # Extract request body type from operation
    private def get_request_body_type(operation : JSON::Any) : String?
      request_body = operation["requestBody"]?
      return nil unless request_body

      content = request_body["content"]?
      return nil unless content

      json_content = content["application/json"]?
      return nil unless json_content

      schema = json_content["schema"]?
      return nil unless schema

      extract_type_from_schema(schema)
    end

    # Extract Crystal type from OpenAPI schema
    private def extract_type_from_schema(schema : JSON::Any) : String?
      # Handle $ref
      if ref = schema["$ref"]?
        ref_path = ref.as_s
        # Convert #/components/schemas/Organization -> Polar::Organization
        if ref_path.starts_with?("#/components/schemas/")
          schema_name = ref_path.sub("#/components/schemas/", "")

          # Handle ListResource_*_ pattern - convert to generic ListResource(T)
          if schema_name.starts_with?("ListResource_")
            # Extract the inner type: ListResource_Organization_ -> Organization
            inner_type = schema_name.sub("ListResource_", "").gsub(/_+$/, "")

            # If inner_type is empty (e.g., ListResource__), we need to look at the actual schema
            if inner_type.empty?
              # Need to fetch the schema and look at items.items.$ref
              if list_schema = @spec["components"]["schemas"][schema_name]?
                if properties = list_schema["properties"]?
                  if items_prop = properties["items"]?
                    if items_array = items_prop["items"]?
                      if inner_ref = items_array["$ref"]?
                        inner_schema_name = inner_ref.as_s.sub("#/components/schemas/", "")
                        inner_class = to_class_name(inner_schema_name)
                        inner_type_qualified = "Polar::Models::#{inner_class}"
                        return "Polar::Models::ListResource(#{inner_type_qualified})"
                      end
                    end
                  end
                end
              end
              # Fallback if we can't determine the type
              return "Polar::Models::ListResource(JSON::Any)"
            end

            inner_class = to_class_name(inner_type)
            inner_type_qualified = "Polar::Models::#{inner_class}"
            return "Polar::Models::ListResource(#{inner_type_qualified})"
          end

          # Handle Webhook*Payload pattern - convert to generic WebhookPayload(T)
          if schema_name.starts_with?("Webhook") && schema_name.ends_with?("Payload")
            # Extract data type from schema
            if webhook_schema = @spec["components"]["schemas"][schema_name]?
              if properties = webhook_schema["properties"]?
                if data_prop = properties["data"]?
                  if data_ref = data_prop["$ref"]?
                    data_schema_name = data_ref.as_s.sub("#/components/schemas/", "")

                    # Check if data references a BenefitGrant*Webhook - need to instantiate it with type parameters
                    if data_schema_name.starts_with?("BenefitGrant") && data_schema_name.ends_with?("Webhook")
                      # Extract benefit and properties types from the referenced schema
                      if grant_schema = @spec["components"]["schemas"][data_schema_name]?
                        if grant_properties = grant_schema["properties"]?
                          benefit_type = nil
                          properties_type = nil

                          if benefit_prop = grant_properties["benefit"]?
                            if benefit_ref = benefit_prop["$ref"]?
                              benefit_schema_name = benefit_ref.as_s.sub("#/components/schemas/", "")
                              benefit_class = to_class_name(benefit_schema_name)
                              benefit_type = "Polar::Models::#{benefit_class}"
                            end
                          end

                          if props_prop = grant_properties["properties"]?
                            if props_ref = props_prop["$ref"]?
                              props_schema_name = props_ref.as_s.sub("#/components/schemas/", "")
                              props_class = to_class_name(props_schema_name)
                              properties_type = "Polar::Models::#{props_class}"
                            end
                          end

                          if benefit_type && properties_type
                            return "Polar::WebhookPayload(Polar::BenefitGrantWebhook(#{benefit_type}, #{properties_type}))"
                          end
                        end
                      end
                    end

                    data_class = to_class_name(data_schema_name)
                    data_type_qualified = "Polar::Models::#{data_class}"
                    return "Polar::WebhookPayload(#{data_type_qualified})"
                  end
                end
              end
            end
          end

          # Handle *Event pattern (system events) - convert to generic SystemEvent(M)
          if schema_name.ends_with?("Event")
            unless ["UserEvent", "SystemEvent", "WebhookEvent"].includes?(schema_name)
              # Extract metadata type from schema
              if event_schema = @spec["components"]["schemas"][schema_name]?
                if properties = event_schema["properties"]?
                  if metadata_prop = properties["metadata"]?
                    if metadata_ref = metadata_prop["$ref"]?
                      metadata_schema_name = metadata_ref.as_s.sub("#/components/schemas/", "")
                      metadata_class = to_class_name(metadata_schema_name)
                      metadata_type_qualified = "Polar::Models::#{metadata_class}"
                      return "Polar::SystemEvent(#{metadata_type_qualified})"
                    end
                  end
                end
              end
            end
          end

          # Handle BenefitGrant*Webhook pattern - convert to generic BenefitGrantWebhook(B, P)
          if schema_name.starts_with?("BenefitGrant") && schema_name.ends_with?("Webhook")
            # Extract benefit and properties types from schema
            if grant_schema = @spec["components"]["schemas"][schema_name]?
              if properties = grant_schema["properties"]?
                benefit_type = nil
                properties_type = nil

                if benefit_prop = properties["benefit"]?
                  if benefit_ref = benefit_prop["$ref"]?
                    benefit_schema_name = benefit_ref.as_s.sub("#/components/schemas/", "")
                    benefit_type = "Polar::Models::#{to_class_name(benefit_schema_name)}"
                  end
                end

                if props_prop = properties["properties"]?
                  if props_ref = props_prop["$ref"]?
                    props_schema_name = props_ref.as_s.sub("#/components/schemas/", "")
                    properties_type = "Polar::Models::#{to_class_name(props_schema_name)}"
                  end
                end

                if benefit_type && properties_type
                  return "Polar::BenefitGrantWebhook(#{benefit_type}, #{properties_type})"
                end
              end
            end
          end

          class_name = to_class_name(schema_name)
          # All types are in Polar::Models namespace
          return "Polar::Models::#{class_name}"
        end
      end

      # Handle oneOf/anyOf (return a union type or first option)
      if one_of = schema["oneOf"]?
        types = one_of.as_a.compact_map { |s| extract_type_from_schema(s) }
        return types.first? unless types.empty?
      end

      if any_of = schema["anyOf"]?
        types = any_of.as_a.compact_map { |s| extract_type_from_schema(s) }
        return types.first? unless types.empty?
      end

      nil
    end

    # Operation context detection and parsing

    # Struct to represent operation context and resource
    struct OperationContext
      property namespace : String?    # e.g., "customer_portal", "oauth2", nil for root
      property resource : String      # e.g., "orders", "subscriptions", "clients"
      property sub_resource : String? # e.g., "payment_methods" for customers.payment_methods
      property operation : String     # e.g., "list", "get", "create"

      def initialize(@namespace, @resource, @sub_resource, @operation)
      end

      def nested? : Bool
        !@namespace.nil?
      end

      def deeply_nested? : Bool
        !@sub_resource.nil?
      end
    end

    # Parse operation ID to extract context, resource, and operation
    # Format: [namespace:]resource:operation or [namespace:]resource:sub_operation_detail
    private def parse_operation_context(operation_id : String) : OperationContext
      # Split by colon
      parts = operation_id.split(':')

      case parts.size
      when 2
        # Format: resource:operation (e.g., "organizations:list", "benefits:create")
        resource = parts[0].tr("-", "_")
        operation = parts[1].tr("-", "_")
        return OperationContext.new(nil, resource, nil, operation)
      when 3
        # Format: namespace:resource:operation (e.g., "customer_portal:benefit-grants:list")
        # OR: oauth2:clients:oauth2:* pattern where there's redundancy
        namespace = parts[0]
        resource = parts[1].tr("-", "_")
        operation = parts[2].tr("-", "_")

        # Handle sub-resource operations in customers (e.g., list_payment_methods)
        if resource == "customers" && operation.includes?("payment_method")
          # This is a payment_methods sub-resource operation
          verb = extract_verb_from_operation(operation)
          return OperationContext.new(namespace, "customers", "payment_methods", verb)
        end

        return OperationContext.new(namespace, resource, nil, operation)
      when 4
        # Format: oauth2:clients:oauth2:operation (has redundant oauth2)
        # Extract: namespace=oauth2, resource=clients, operation=operation
        namespace = parts[0]
        resource = parts[1].tr("-", "_")
        # Skip parts[2] as it's redundant "oauth2"
        operation = parts[3].tr("-", "_")
        return OperationContext.new(namespace, resource, nil, operation)
      else
        # Fallback for unexpected formats
        puts "WARNING: Unexpected operation ID format: #{operation_id}"
        return OperationContext.new(nil, operation_id, nil, "execute")
      end
    end

    # Extract verb from operation string (e.g., "list_payment_methods" -> "list")
    private def extract_verb_from_operation(operation : String) : String
      # Common CRUD verbs
      crud_verbs = ["list", "get", "create", "update", "delete", "patch", "add", "confirm", "remove"]

      # Check if operation starts with a verb
      crud_verbs.each do |verb|
        if operation.starts_with?(verb)
          return verb
        end
      end

      # Fallback: return the whole operation
      operation
    end

    # Utility methods for naming conventions
    private def to_class_name(name : String) : String
      # Remove trailing underscores first
      cleaned = name.gsub(/_+$/, "")

      # Split by underscore or hyphen
      parts = cleaned.split(/[_-]/)

      # For each part, only capitalize if it's all lowercase
      # This preserves existing PascalCase like "ListResource"
      parts.map do |part|
        if part == part.downcase
          part.capitalize
        else
          part
        end
      end.join
    end

    private def to_snake_case(name : String) : String
      name.gsub(/([A-Z]+)([A-Z][a-z])/, "\\1_\\2")
        .gsub(/([a-z\d])([A-Z])/, "\\1_\\2")
        .gsub(/-/, "_")
        .downcase
    end

    # Sanitize description text for use in doc comments
    # Removes markdown formatting that could break Crystal syntax
    private def sanitize_description(text : String) : String
      text.gsub("**", "").gsub("*", "").gsub("`", "")
    end
  end
end

# Run the generator
case ARGV.size
when 0
  # Use default Polar API URL
  generator = Polar::Generator.new
  generator.generate!
when 1
  # Allow custom URL (for sandbox or local testing)
  generator = Polar::Generator.new(ARGV[0])
  generator.generate!
else
  puts "Usage: crystal run src/generate.cr [openapi_url]"
  puts ""
  puts "Examples:"
  puts "  crystal run src/generate.cr"
  puts "  crystal run src/generate.cr https://sandbox-api.polar.sh/openapi.json"
  exit 1
end
