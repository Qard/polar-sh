require "../../spec_helper"

describe Polar::Api::Metrics do
  it "has accessor method on client" do
    client = Polar::Client.new
    client.metrics.should be_a(Polar::Api::Metrics)
  end

  it "has get method" do
    client = Polar::Client.new
    api = client.metrics
    api.responds_to?(:get).should be_true
  end

  it "has limits method" do
    client = Polar::Client.new
    api = client.metrics
    api.responds_to?(:limits).should be_true
  end

  # Integration tests - run with POLAR_ACCESS_TOKEN set
  describe "integration", tags: "integration" do
    it "Get Metrics Limits" do
      client = Polar::Client.new(access_token: ENV["POLAR_ACCESS_TOKEN"])

      # This endpoint is not available in the sandbox environment,
      # so we expect it to raise a ResourceNotFoundError
      expect_raises(Polar::ResourceNotFoundError) do
        client.metrics.limits
      end
    end
  end
end
