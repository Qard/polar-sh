require "../../spec_helper"

describe Polar::Api::CustomerPortal do
  it "has namespace accessor on client" do
    client = Polar::Client.new
    client.customer_portal.should be_a(Polar::Api::CustomerPortal::Base)
  end

  describe Polar::Api::CustomerPortal::BenefitGrants do
    it "has accessor method on namespace" do
      client = Polar::Client.new
      client.customer_portal.benefit_grants.should be_a(Polar::Api::CustomerPortal::BenefitGrants)
    end
  end

  describe Polar::Api::CustomerPortal::Customers do
    it "has accessor method on namespace" do
      client = Polar::Client.new
      client.customer_portal.customers.should be_a(Polar::Api::CustomerPortal::Customers)
    end
  end

  describe Polar::Api::CustomerPortal::CustomerMeters do
    it "has accessor method on namespace" do
      client = Polar::Client.new
      client.customer_portal.customer_meters.should be_a(Polar::Api::CustomerPortal::CustomerMeters)
    end
  end

  describe Polar::Api::CustomerPortal::Seats do
    it "has accessor method on namespace" do
      client = Polar::Client.new
      client.customer_portal.seats.should be_a(Polar::Api::CustomerPortal::Seats)
    end
  end

  describe Polar::Api::CustomerPortal::CustomerSession do
    it "has accessor method on namespace" do
      client = Polar::Client.new
      client.customer_portal.customer_session.should be_a(Polar::Api::CustomerPortal::CustomerSession)
    end
  end

  describe Polar::Api::CustomerPortal::Downloadables do
    it "has accessor method on namespace" do
      client = Polar::Client.new
      client.customer_portal.downloadables.should be_a(Polar::Api::CustomerPortal::Downloadables)
    end
  end

  describe Polar::Api::CustomerPortal::LicenseKeys do
    it "has accessor method on namespace" do
      client = Polar::Client.new
      client.customer_portal.license_keys.should be_a(Polar::Api::CustomerPortal::LicenseKeys)
    end
  end

  describe Polar::Api::CustomerPortal::Orders do
    it "has accessor method on namespace" do
      client = Polar::Client.new
      client.customer_portal.orders.should be_a(Polar::Api::CustomerPortal::Orders)
    end
  end

  describe Polar::Api::CustomerPortal::Organizations do
    it "has accessor method on namespace" do
      client = Polar::Client.new
      client.customer_portal.organizations.should be_a(Polar::Api::CustomerPortal::Organizations)
    end
  end

  describe Polar::Api::CustomerPortal::Subscriptions do
    it "has accessor method on namespace" do
      client = Polar::Client.new
      client.customer_portal.subscriptions.should be_a(Polar::Api::CustomerPortal::Subscriptions)
    end
  end

  describe Polar::Api::CustomerPortal::Wallets do
    it "has accessor method on namespace" do
      client = Polar::Client.new
      client.customer_portal.wallets.should be_a(Polar::Api::CustomerPortal::Wallets)
    end
  end
end
