# Scope
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    enum Scope
      Openid
      Profile
      Email
      Userread
      Webread
      Webwrite
      Organizationsread
      Organizationswrite
      CustomFieldsread
      CustomFieldswrite
      Discountsread
      Discountswrite
      CheckoutLinksread
      CheckoutLinkswrite
      Checkoutsread
      Checkoutswrite
      Transactionsread
      Transactionswrite
      Payoutsread
      Payoutswrite
      Productsread
      Productswrite
      Benefitsread
      Benefitswrite
      Eventsread
      Eventswrite
      Metersread
      Meterswrite
      Filesread
      Fileswrite
      Subscriptionsread
      Subscriptionswrite
      Customersread
      Customerswrite
      Walletsread
      Walletswrite
      CustomerMetersread
      CustomerSessionswrite
      CustomerSeatsread
      CustomerSeatswrite
      Ordersread
      Orderswrite
      Refundsread
      Refundswrite
      Paymentsread
      Metricsread
      Webhooksread
      Webhookswrite
      ExternalOrganizationsread
      LicenseKeysread
      LicenseKeyswrite
      Repositoriesread
      Repositorieswrite
      Issuesread
      Issueswrite
      CustomerPortalread
      CustomerPortalwrite
      Notificationsread
      Notificationswrite
      NotificationRecipientsread
      NotificationRecipientswrite

      # Serialize to JSON using snake_case string values
      def to_json(json : JSON::Builder)
        str = to_s.underscore
        # Handle Neg prefix (convert back to - prefix)
        str = "-" + str[4..] if str.starts_with?("neg_")
        json.string(str)
      end

      # Deserialize from JSON
      def self.from_json(parser : JSON::PullParser) : self
        value = parser.read_string
        # Handle negative prefix
        is_negative = value.starts_with?("-")
        clean_value = is_negative ? value[1..] : value
        member_name = clean_value.split('_').map(&.capitalize).join
        member_name = "Neg" + member_name if is_negative
        parse(member_name)
      end
    end
  end
end
