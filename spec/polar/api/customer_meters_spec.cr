require "../../spec_helper"

describe Polar::Api::CustomerMeters do
  it "has accessor method on client" do
    client = Polar::Client.new
    client.customer_meters.should be_a(Polar::Api::CustomerMeters)
  end

  it "has list method" do
    client = Polar::Client.new
    api = client.customer_meters
    api.responds_to?(:list).should be_true
  end

  it "has get method" do
    client = Polar::Client.new
    api = client.customer_meters
    api.responds_to?(:get).should be_true
  end

  # Integration tests - run with POLAR_ACCESS_TOKEN set
  describe "integration", tags: "integration" do
    it "List Customer Meters" do
      client = Polar::Client.new(access_token: ENV["POLAR_ACCESS_TOKEN"])

      # This endpoint is not available in the sandbox environment,
      # so we expect it to raise a ResourceNotFoundError
      expect_raises(Polar::ResourceNotFoundError) do
        client.customer_meters.list
      end
    end
  end
end
