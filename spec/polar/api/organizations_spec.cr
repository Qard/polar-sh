require "../../spec_helper"

describe Polar::Api::Organizations do
  it "has accessor method on client" do
    client = Polar::Client.new
    client.organizations.should be_a(Polar::Api::Organizations)
  end

  it "has list method" do
    client = Polar::Client.new
    api = client.organizations
    api.responds_to?(:list).should be_true
  end

  it "has create method" do
    client = Polar::Client.new
    api = client.organizations
    api.responds_to?(:create).should be_true
  end

  it "has get method" do
    client = Polar::Client.new
    api = client.organizations
    api.responds_to?(:get).should be_true
  end

  it "has update method" do
    client = Polar::Client.new
    api = client.organizations
    api.responds_to?(:update).should be_true
  end

  # Integration tests - run with POLAR_ACCESS_TOKEN set
  describe "integration", tags: "integration" do
    it "List Organizations" do
      client = Polar::Client.new(access_token: ENV["POLAR_ACCESS_TOKEN"])

      # This endpoint is not available in the sandbox environment,
      # so we expect it to raise a ResourceNotFoundError
      expect_raises(Polar::ResourceNotFoundError) do
        client.organizations.list
      end
    end
  end
end
