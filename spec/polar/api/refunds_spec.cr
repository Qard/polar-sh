require "../../spec_helper"

describe Polar::Api::Refunds do
  it "has accessor method on client" do
    client = Polar::Client.new
    client.refunds.should be_a(Polar::Api::Refunds)
  end

  it "has list method" do
    client = Polar::Client.new
    api = client.refunds
    api.responds_to?(:list).should be_true
  end

  it "has create method" do
    client = Polar::Client.new
    api = client.refunds
    api.responds_to?(:create).should be_true
  end

  # Integration tests - run with POLAR_ACCESS_TOKEN set
  describe "integration", tags: "integration" do
    it "List Refunds" do
      client = Polar::Client.new(access_token: ENV["POLAR_ACCESS_TOKEN"])

      # This endpoint is not available in the sandbox environment,
      # so we expect it to raise a ResourceNotFoundError
      expect_raises(Polar::ResourceNotFoundError) do
        client.refunds.list
      end
    end
  end
end
