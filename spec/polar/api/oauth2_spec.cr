require "../../spec_helper"

describe Polar::Api::Oauth2 do
  it "has namespace accessor on client" do
    client = Polar::Client.new
    client.oauth2.should be_a(Polar::Api::Oauth2::Base)
  end

  describe Polar::Api::Oauth2::Clients do
    it "has accessor method on namespace" do
      client = Polar::Client.new
      client.oauth2.clients.should be_a(Polar::Api::Oauth2::Clients)
    end
  end
end
