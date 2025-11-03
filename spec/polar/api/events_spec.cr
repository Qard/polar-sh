require "../../spec_helper"

describe Polar::Api::Events do
  it "has accessor method on client" do
    client = Polar::Client.new
    client.events.should be_a(Polar::Api::Events)
  end

  it "has list method" do
    client = Polar::Client.new
    api = client.events
    api.responds_to?(:list).should be_true
  end

  it "has list_names method" do
    client = Polar::Client.new
    api = client.events
    api.responds_to?(:list_names).should be_true
  end

  it "has get method" do
    client = Polar::Client.new
    api = client.events
    api.responds_to?(:get).should be_true
  end

  it "has ingest method" do
    client = Polar::Client.new
    api = client.events
    api.responds_to?(:ingest).should be_true
  end

  # Integration tests - run with POLAR_ACCESS_TOKEN set
  describe "integration", tags: "integration" do
    it "List Events" do
      client = Polar::Client.new(access_token: ENV["POLAR_ACCESS_TOKEN"])

      # This endpoint is not available in the sandbox environment,
      # so we expect it to raise a ResourceNotFoundError
      expect_raises(Polar::ResourceNotFoundError) do
        client.events.list
      end
    end

    it "List Event Names" do
      client = Polar::Client.new(access_token: ENV["POLAR_ACCESS_TOKEN"])

      # This endpoint is not available in the sandbox environment,
      # so we expect it to raise a ResourceNotFoundError
      expect_raises(Polar::ResourceNotFoundError) do
        client.events.list_names
      end
    end
  end
end
