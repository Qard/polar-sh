require "../../spec_helper"

describe Polar::Api::Subscriptions do
  it "has accessor method on client" do
    client = Polar::Client.new
    client.subscriptions.should be_a(Polar::Api::Subscriptions)
  end

  it "has list method" do
    client = Polar::Client.new
    api = client.subscriptions
    api.responds_to?(:list).should be_true
  end

  it "has create method" do
    client = Polar::Client.new
    api = client.subscriptions
    api.responds_to?(:create).should be_true
  end

  it "has export method" do
    client = Polar::Client.new
    api = client.subscriptions
    api.responds_to?(:export).should be_true
  end

  it "has get method" do
    client = Polar::Client.new
    api = client.subscriptions
    api.responds_to?(:get).should be_true
  end

  it "has update method" do
    client = Polar::Client.new
    api = client.subscriptions
    api.responds_to?(:update).should be_true
  end

  it "has revoke method" do
    client = Polar::Client.new
    api = client.subscriptions
    api.responds_to?(:revoke).should be_true
  end

  # Integration tests - run with POLAR_ACCESS_TOKEN set
  describe "integration", tags: "integration" do
    it "List Subscriptions" do
      client = Polar::Client.new(access_token: ENV["POLAR_ACCESS_TOKEN"])

      # This endpoint is not available in the sandbox environment,
      # so we expect it to raise a ResourceNotFoundError
      expect_raises(Polar::ResourceNotFoundError) do
        client.subscriptions.list
      end
    end

    it "Export Subscriptions" do
      client = Polar::Client.new(access_token: ENV["POLAR_ACCESS_TOKEN"])

      # This endpoint is not available in the sandbox environment,
      # so we expect it to raise a ResourceNotFoundError
      expect_raises(Polar::ResourceNotFoundError) do
        client.subscriptions.export
      end
    end
  end
end
