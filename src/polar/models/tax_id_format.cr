# TaxIDFormat
#
# List of supported tax ID formats.
#
# Ref: https://docs.stripe.com/billing/customer/tax-ids#supported-tax-id
#
# Auto-generated from OpenAPI spec
module Polar
  module Models
    enum TaxIDFormat
      AdNrt
      AeTrn
      ArCuit
      AuAbn
      AuArn
      BgUic
      BhVat
      BoTin
      BrCnpj
      BrCpf
      CaBn
      CaGstHst
      CaPstBc
      CaPstMb
      CaPstSk
      CaQst
      ChUid
      ChVat
      ClTin
      CnTin
      CoNit
      CrTin
      DeStn
      DoRcn
      EcRuc
      EgTin
      EsCif
      EuOssVat
      EuVat
      GbVat
      GeVat
      HkBr
      HrOib
      HuTin
      IdNpwp
      IlVat
      InGst
      IsVat
      JpCn
      JpRn
      JpTrn
      KePin
      KrBrn
      KzBin
      LiUid
      MxRfc
      MyFrp
      MyItn
      MySst
      NgTin
      NoVat
      NoVoec
      NzGst
      OmVat
      PeRuc
      PhTin
      RoTin
      RsPib
      RuInn
      RuKpp
      SaVat
      SgGst
      SgUen
      SiTin
      SvNit
      ThVat
      TrTin
      TwVat
      UaVat
      UsEin
      UyRuc
      VeRif
      VnTin
      ZaVat

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
