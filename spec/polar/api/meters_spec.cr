require "../../spec_helper"

describe Polar::Api::Meters do
  it "has accessor method on client" do
    client = Polar::Client.new
    client.meters.should be_a(Polar::Api::Meters)
  end

  it "has list method" do
    client = Polar::Client.new
    api = client.meters
    api.responds_to?(:list).should be_true
  end

  it "has create method" do
    client = Polar::Client.new
    api = client.meters
    api.responds_to?(:create).should be_true
  end

  it "has get method" do
    client = Polar::Client.new
    api = client.meters
    api.responds_to?(:get).should be_true
  end

  it "has update method" do
    client = Polar::Client.new
    api = client.meters
    api.responds_to?(:update).should be_true
  end

  it "has quantities method" do
    client = Polar::Client.new
    api = client.meters
    api.responds_to?(:quantities).should be_true
  end

  # Integration tests - run with POLAR_ACCESS_TOKEN set
  describe "integration", tags: "integration" do
    it "List Meters" do
      client = Polar::Client.new(access_token: ENV["POLAR_ACCESS_TOKEN"])

      # This endpoint is not available in the sandbox environment,
      # so we expect it to raise a ResourceNotFoundError
      expect_raises(Polar::ResourceNotFoundError) do
        client.meters.list
      end
    end
  end
end
