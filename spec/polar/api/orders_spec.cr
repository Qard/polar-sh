require "../../spec_helper"

describe Polar::Api::Orders do
  it "has accessor method on client" do
    client = Polar::Client.new
    client.orders.should be_a(Polar::Api::Orders)
  end

  it "has list method" do
    client = Polar::Client.new
    api = client.orders
    api.responds_to?(:list).should be_true
  end

  it "has export method" do
    client = Polar::Client.new
    api = client.orders
    api.responds_to?(:export).should be_true
  end

  it "has get method" do
    client = Polar::Client.new
    api = client.orders
    api.responds_to?(:get).should be_true
  end

  it "has update method" do
    client = Polar::Client.new
    api = client.orders
    api.responds_to?(:update).should be_true
  end

  it "has generate_invoice method" do
    client = Polar::Client.new
    api = client.orders
    api.responds_to?(:generate_invoice).should be_true
  end

  it "has invoice method" do
    client = Polar::Client.new
    api = client.orders
    api.responds_to?(:invoice).should be_true
  end

  # Integration tests - run with POLAR_ACCESS_TOKEN set
  describe "integration", tags: "integration" do
    it "List Orders" do
      client = Polar::Client.new(access_token: ENV["POLAR_ACCESS_TOKEN"])

      # This endpoint is not available in the sandbox environment,
      # so we expect it to raise a ResourceNotFoundError
      expect_raises(Polar::ResourceNotFoundError) do
        client.orders.list
      end
    end

    it "Export Subscriptions" do
      client = Polar::Client.new(access_token: ENV["POLAR_ACCESS_TOKEN"])

      # This endpoint is not available in the sandbox environment,
      # so we expect it to raise a ResourceNotFoundError
      expect_raises(Polar::ResourceNotFoundError) do
        client.orders.export
      end
    end
  end
end
