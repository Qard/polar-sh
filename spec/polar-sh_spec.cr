require "./spec_helper"

# Basic smoke tests for the Polar.sh SDK
# Since this is an auto-generated SDK, we mainly verify that:
# 1. The SDK compiles
# 2. Basic initialization works
# 3. Core modules are accessible

describe Polar do
  it "has a version" do
    Polar::VERSION.should_not be_nil
  end

  describe "Client" do
    it "can be initialized with access token" do
      client = Polar::Client.new(access_token: "test_token")
      client.access_token.should eq("test_token")
      # Uses POLAR_SERVER_URL from spec_helper
      client.server_url.should eq("https://sandbox.polar.sh")
    end

    it "can be initialized with custom server URL" do
      client = Polar::Client.new(
        access_token: "test_token",
        server_url: "https://custom.api.com/"
      )
      client.server_url.should eq("https://custom.api.com")
    end

    it "uses custom server URL from parameter" do
      client = Polar::Client.new(access_token: "test_token", server_url: "https://sandbox.polar.sh")
      client.server_url.should eq("https://sandbox.polar.sh")
    end

    it "raises exception when no access token is provided" do
      # Temporarily remove POLAR_ACCESS_TOKEN from environment
      original_token = ENV["POLAR_ACCESS_TOKEN"]?
      ENV.delete("POLAR_ACCESS_TOKEN")

      expect_raises(Exception, "POLAR_ACCESS_TOKEN environment variable not set") do
        Polar::Client.new
      end

      # Restore original token
      ENV["POLAR_ACCESS_TOKEN"] = original_token if original_token
    end

    it "uses environment variables when initialized without parameters" do
      client = Polar::Client.new
      client.access_token.should eq(ENV["POLAR_ACCESS_TOKEN"])
      client.server_url.should eq("https://sandbox.polar.sh")
    end

    it "has API resource accessors" do
      client = Polar::Client.new
      client.organizations.should be_a(Polar::Api::Organizations)
      client.customers.should be_a(Polar::Api::Customers)
      client.products.should be_a(Polar::Api::Products)
      client.subscriptions.should be_a(Polar::Api::Subscriptions)
      client.orders.should be_a(Polar::Api::Orders)
    end
  end

  describe "Errors" do
    it "has proper exception hierarchy" do
      (Polar::ResourceNotFoundError.new).should be_a(Polar::PolarError)
      (Polar::NotPermittedError.new).should be_a(Polar::PolarError)
      (Polar::HTTPValidationError.new).should be_a(Polar::PolarError)
      (Polar::WebhookVerificationError.new).should be_a(Polar::PolarError)
    end
  end
end
