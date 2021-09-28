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
  }) {
    var key = utf8.encode(vendorSecurityKey);
    var dataString =
        "$live$oid$inv$ttl$tel$eml$vendorId$curr$p1$p2$p3$p4$cbk$cst$crl";
    var bytes = utf8.encode(dataString);

    var hmacSha1 = Hmac(sha1, key); // HMAC-SHA256
    var digest = hmacSha1.convert(bytes);

    //Craft url
    final url = baseUrl +
        "live=$live&oid=$oid&inv=$inv&ttl=$ttl&tel=$tel&eml=$eml&vid=$vendorId&curr=$curr&p1=$p1&p2=$p2&p3=$p3&p4=$p4&cbk=$cbk&cst=$cst&crl=$crl&hsh=$digest&autopay=0";

    return url;
  }

  // bool parameterValidation() {

  //   return false;
  // }
}
