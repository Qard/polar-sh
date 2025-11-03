require "../../spec_helper"

describe Polar::Api::Customers do
  it "has accessor method on client" do
    client = Polar::Client.new
    client.customers.should be_a(Polar::Api::Customers)
  end

  it "has list method" do
    client = Polar::Client.new
    api = client.customers
    api.responds_to?(:list).should be_true
  end

  it "has create method" do
    client = Polar::Client.new
    api = client.customers
    api.responds_to?(:create).should be_true
  end

  it "has export method" do
    client = Polar::Client.new
    api = client.customers
    api.responds_to?(:export).should be_true
  end

  it "has get method" do
    client = Polar::Client.new
    api = client.customers
    api.responds_to?(:get).should be_true
  end

  it "has update method" do
    client = Polar::Client.new
    api = client.customers
    api.responds_to?(:update).should be_true
  end

  it "has delete method" do
    client = Polar::Client.new
    api = client.customers
    api.responds_to?(:delete).should be_true
  end

  it "has get_external method" do
    client = Polar::Client.new
    api = client.customers
    api.responds_to?(:get_external).should be_true
  end

  it "has update_external method" do
    client = Polar::Client.new
    api = client.customers
    api.responds_to?(:update_external).should be_true
  end

  it "has delete_external method" do
    client = Polar::Client.new
    api = client.customers
    api.responds_to?(:delete_external).should be_true
  end

  it "has get_state method" do
    client = Polar::Client.new
    api = client.customers
    api.responds_to?(:get_state).should be_true
  end

  it "has get_state_external method" do
    client = Polar::Client.new
    api = client.customers
    api.responds_to?(:get_state_external).should be_true
  end

  it "has get_balance method" do
    client = Polar::Client.new
    api = client.customers
    api.responds_to?(:get_balance).should be_true
  end

  # Integration tests - run with POLAR_ACCESS_TOKEN set
  describe "integration", tags: "integration" do
    it "List Customers" do
      client = Polar::Client.new(access_token: ENV["POLAR_ACCESS_TOKEN"])

      # This endpoint is not available in the sandbox environment,
      # so we expect it to raise a ResourceNotFoundError
      expect_raises(Polar::ResourceNotFoundError) do
        client.customers.list
      end
    end

    it "Export Customers" do
      client = Polar::Client.new(access_token: ENV["POLAR_ACCESS_TOKEN"])

      # This endpoint is not available in the sandbox environment,
      # so we expect it to raise a ResourceNotFoundError
      expect_raises(Polar::ResourceNotFoundError) do
        client.customers.export
      end
    end
  end
end
