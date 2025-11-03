require "../../spec_helper"

describe Polar::Api::CustomerSeats do
  it "has accessor method on client" do
    client = Polar::Client.new
    client.customer_seats.should be_a(Polar::Api::CustomerSeats)
  end

  it "has assign_seat method" do
    client = Polar::Client.new
    api = client.customer_seats
    api.responds_to?(:assign_seat).should be_true
  end

  it "has list_seats method" do
    client = Polar::Client.new
    api = client.customer_seats
    api.responds_to?(:list_seats).should be_true
  end

  it "has revoke_seat method" do
    client = Polar::Client.new
    api = client.customer_seats
    api.responds_to?(:revoke_seat).should be_true
  end

  it "has resend_invitation method" do
    client = Polar::Client.new
    api = client.customer_seats
    api.responds_to?(:resend_invitation).should be_true
  end

  it "has get_claim_info method" do
    client = Polar::Client.new
    api = client.customer_seats
    api.responds_to?(:get_claim_info).should be_true
  end

  it "has claim_seat method" do
    client = Polar::Client.new
    api = client.customer_seats
    api.responds_to?(:claim_seat).should be_true
  end

  # Integration tests - run with POLAR_ACCESS_TOKEN set
  describe "integration", tags: "integration" do
    it "List Seats" do
      client = Polar::Client.new(access_token: ENV["POLAR_ACCESS_TOKEN"])

      # This endpoint is not available in the sandbox environment,
      # so we expect it to raise a ResourceNotFoundError
      expect_raises(Polar::ResourceNotFoundError) do
        client.customer_seats.list_seats
      end
    end
  end
end
