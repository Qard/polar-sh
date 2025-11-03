require "../../spec_helper"

describe Polar::Api::CustomerSessions do
  it "has accessor method on client" do
    client = Polar::Client.new
    client.customer_sessions.should be_a(Polar::Api::CustomerSessions)
  end

  it "has create method" do
    client = Polar::Client.new
    api = client.customer_sessions
    api.responds_to?(:create).should be_true
  end

  # Integration tests - run with POLAR_ACCESS_TOKEN set
  describe "integration", tags: "integration" do
  end
end
