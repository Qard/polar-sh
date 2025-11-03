require "../../spec_helper"

describe Polar::Api::BenefitGrants do
  it "has accessor method on client" do
    client = Polar::Client.new
    client.benefit_grants.should be_a(Polar::Api::BenefitGrants)
  end

  it "has list method" do
    client = Polar::Client.new
    api = client.benefit_grants
    api.responds_to?(:list).should be_true
  end

  # Integration tests - run with POLAR_ACCESS_TOKEN set
  describe "integration", tags: "integration" do
    it "List Benefit Grants" do
      client = Polar::Client.new(access_token: ENV["POLAR_ACCESS_TOKEN"])

      # This endpoint is not available in the sandbox environment,
      # so we expect it to raise a ResourceNotFoundError
      expect_raises(Polar::ResourceNotFoundError) do
        client.benefit_grants.list
      end
    end
  end
end
