require "../../spec_helper"

describe Polar::Api::Webhooks do
  it "has accessor method on client" do
    client = Polar::Client.new
    client.webhooks.should be_a(Polar::Api::Webhooks)
  end

  it "has list_webhook_endpoints method" do
    client = Polar::Client.new
    api = client.webhooks
    api.responds_to?(:list_webhook_endpoints).should be_true
  end

  it "has create_webhook_endpoint method" do
    client = Polar::Client.new
    api = client.webhooks
    api.responds_to?(:create_webhook_endpoint).should be_true
  end

  it "has get_webhook_endpoint method" do
    client = Polar::Client.new
    api = client.webhooks
    api.responds_to?(:get_webhook_endpoint).should be_true
  end

  it "has update_webhook_endpoint method" do
    client = Polar::Client.new
    api = client.webhooks
    api.responds_to?(:update_webhook_endpoint).should be_true
  end

  it "has delete_webhook_endpoint method" do
    client = Polar::Client.new
    api = client.webhooks
    api.responds_to?(:delete_webhook_endpoint).should be_true
  end

  it "has reset_webhook_endpoint_secret method" do
    client = Polar::Client.new
    api = client.webhooks
    api.responds_to?(:reset_webhook_endpoint_secret).should be_true
  end

  it "has list_webhook_deliveries method" do
    client = Polar::Client.new
    api = client.webhooks
    api.responds_to?(:list_webhook_deliveries).should be_true
  end

  it "has redeliver_webhook_event method" do
    client = Polar::Client.new
    api = client.webhooks
    api.responds_to?(:redeliver_webhook_event).should be_true
  end

  # Integration tests - run with POLAR_ACCESS_TOKEN set
  describe "integration", tags: "integration" do
    it "List Webhook Endpoints" do
      client = Polar::Client.new(access_token: ENV["POLAR_ACCESS_TOKEN"])

      # This endpoint is not available in the sandbox environment,
      # so we expect it to raise a ResourceNotFoundError
      expect_raises(Polar::ResourceNotFoundError) do
        client.webhooks.list_webhook_endpoints
      end
    end

    it "List Webhook Deliveries" do
      client = Polar::Client.new(access_token: ENV["POLAR_ACCESS_TOKEN"])

      # This endpoint is not available in the sandbox environment,
      # so we expect it to raise a ResourceNotFoundError
      expect_raises(Polar::ResourceNotFoundError) do
        client.webhooks.list_webhook_deliveries
      end
    end
  end
end
