require "openssl/hmac"
require "base64"

module Polar
  module Webhooks
    VERSION        = "v1"
    TOLERANCE_SECS = 300

    def self.validate_event(body : String | Bytes, headers : Hash(String, String) | HTTP::Headers, secret : String, tolerance : Int32 = TOLERANCE_SECS) : JSON::Any
      webhook_id = get_header(headers, "webhook-id")
      webhook_timestamp = get_header(headers, "webhook-timestamp")
      webhook_signature = get_header(headers, "webhook-signature")
      verify_timestamp(webhook_timestamp, tolerance)
      body_string = body.is_a?(Bytes) ? String.new(body) : body
      expected_signature = compute_signature(secret, webhook_id, webhook_timestamp, body_string)
      raise WebhookVerificationError.new("Invalid webhook signature") unless verify_signature(expected_signature, webhook_signature)
      JSON.parse(body_string)
    end

    private def self.get_header(headers : Hash(String, String) | HTTP::Headers, key : String) : String
      value = headers.is_a?(HTTP::Headers) ? headers[key]? : headers[key]?
      raise WebhookVerificationError.new("Missing #{key} header") unless value
      value
    end

    private def self.verify_timestamp(timestamp : String, tolerance : Int32)
      ts = timestamp.to_i64 rescue raise WebhookVerificationError.new("Invalid webhook timestamp")
      raise WebhookVerificationError.new("Webhook timestamp too old") if (Time.utc.to_unix - ts).abs > tolerance
    end

    private def self.compute_signature(secret : String, webhook_id : String, timestamp : String, payload : String) : String
      hmac = OpenSSL::HMAC.digest(OpenSSL::Algorithm::SHA256, secret, "#{webhook_id}.#{timestamp}.#{payload}")
      "#{VERSION},#{Base64.strict_encode(hmac)}"
    end

    private def self.verify_signature(expected : String, actual : String) : Bool
      actual.split(' ').any? { |sig| secure_compare(expected, sig) }
    end

    private def self.secure_compare(a : String, b : String) : Bool
      return false if a.bytesize != b.bytesize
      result = 0
      a.bytes.zip(b.bytes) { |x, y| result |= x ^ y }
      result == 0
    end
  end
end
