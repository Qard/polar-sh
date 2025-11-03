require "../../spec_helper"

describe Polar::Api::LicenseKeys do
  it "has accessor method on client" do
    client = Polar::Client.new
    client.license_keys.should be_a(Polar::Api::LicenseKeys)
  end

  it "has list method" do
    client = Polar::Client.new
    api = client.license_keys
    api.responds_to?(:list).should be_true
  end

  it "has get method" do
    client = Polar::Client.new
    api = client.license_keys
    api.responds_to?(:get).should be_true
  end

  it "has update method" do
    client = Polar::Client.new
    api = client.license_keys
    api.responds_to?(:update).should be_true
  end

  it "has get_activation method" do
    client = Polar::Client.new
    api = client.license_keys
    api.responds_to?(:get_activation).should be_true
  end

  it "has validate method" do
    client = Polar::Client.new
    api = client.license_keys
    api.responds_to?(:validate).should be_true
  end

  it "has activate method" do
    client = Polar::Client.new
    api = client.license_keys
    api.responds_to?(:activate).should be_true
  end

  it "has deactivate method" do
    client = Polar::Client.new
    api = client.license_keys
    api.responds_to?(:deactivate).should be_true
  end

  # Integration tests - run with POLAR_ACCESS_TOKEN set
  describe "integration", tags: "integration" do
    it "List License Keys" do
      client = Polar::Client.new(access_token: ENV["POLAR_ACCESS_TOKEN"])

      # This endpoint is not available in the sandbox environment,
      # so we expect it to raise a ResourceNotFoundError
      expect_raises(Polar::ResourceNotFoundError) do
        client.license_keys.list
      end
    end
  end
end
