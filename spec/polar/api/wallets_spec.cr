require "../../spec_helper"

describe Polar::Api::Wallets do
  it "has accessor method on client" do
    client = Polar::Client.new
    client.wallets.should be_a(Polar::Api::Wallets)
  end

  it "has list method" do
    client = Polar::Client.new
    api = client.wallets
    api.responds_to?(:list).should be_true
  end

  it "has get method" do
    client = Polar::Client.new
    api = client.wallets
    api.responds_to?(:get).should be_true
  end

  it "has top_up method" do
    client = Polar::Client.new
    api = client.wallets
    api.responds_to?(:top_up).should be_true
  end

  # Integration tests - run with POLAR_ACCESS_TOKEN set
  describe "integration", tags: "integration" do
    it "List Wallets" do
      client = Polar::Client.new(access_token: ENV["POLAR_ACCESS_TOKEN"])

      # This endpoint is not available in the sandbox environment,
      # so we expect it to raise a ResourceNotFoundError
      expect_raises(Polar::ResourceNotFoundError) do
        client.wallets.list
      end
    end
  end
end
