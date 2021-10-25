library ipaycheckout;

import 'dart:convert';

import 'package:crypto/crypto.dart';

class IPay {
  late final String baseUrl = "https://payments.ipayafrica.com/v3/ke?";
  final String vendorId;
  final String vendorSecurityKey;

  IPay({required this.vendorId, required this.vendorSecurityKey});

  String checkoutUrl({
    required String live,
    required String oid,
    required String inv,
    required String ttl,
    required String tel,
    required String eml,
    required String curr,
    String p1 = "",
    String p2 = "",
    String p3 = "",
    String p4 = "",
    required String cbk,
    required String cst,
    required String crl,
    String mpesa = "1",
    String bonga = "1",
    String airtel = "1",
    String equity = "1",
    String creditcard = "1",
    String mobilebanking = "0",
    String mkoporahisi = "0",
    String saida = "0",
    String elipa = "0",
    String unionpay = "0",
    String mvisa = "0",
    String vooma = "0",
    String pesalink = "0",
    String autopay = "0",
  }) {
    var key = utf8.encode(vendorSecurityKey);
    var newPhoneNumber = tel.replaceAll(RegExp(r'[^\w]+'), '');
    var finalAmount =
        double.parse(ttl.replaceAll(RegExp(r'[^\w.]+'), '')).toStringAsFixed(0);
    var dataString =
        "$live$oid$inv$finalAmount$newPhoneNumber$eml$vendorId$curr$p1$p2$p3$p4$cbk$cst$crl";
    var bytes = utf8.encode(dataString);

    var hmacSha1 = Hmac(sha1, key); // HMAC-SHA256
    var digest = hmacSha1.convert(bytes);

    //Craft url
    final url = baseUrl +
        "live=$live&oid=$oid&inv=$inv&ttl=$finalAmount&tel=$newPhoneNumber&eml=$eml&vid=$vendorId&curr=$curr&p1=$p1&p2=$p2&p3=$p3&p4=$p4&cbk=$cbk&cst=$cst&crl=$crl&hsh=$digest&mpesa=$mpesa&bonga=$bonga&airtel=$airtel&equity=$equity&creditcard=$creditcard&mobilebanking=$mobilebanking&mkoporahisi=$mkoporahisi&saida=$saida&elipa=$elipa&unionpay=$unionpay&mvisa=$mvisa&vooma=$vooma&pesalink=$pesalink&autopay=$autopay";

    return url;
  }
}
