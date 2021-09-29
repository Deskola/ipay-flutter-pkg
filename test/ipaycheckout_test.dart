import 'package:flutter_test/flutter_test.dart';

import 'package:ipaycheckout/ipaycheckout.dart';

void main() {
  test('adds one to input values', () {
    final ipay = IPay(vendorId: "demo", vendorSecurityKey: "demoCHANGED");
    expect(
        ipay.checkoutUrl(
            live: "1",
            oid: "123",
            inv: "123",
            ttl: "1",
            tel: "0711111111",
            eml: "example@example.com",
            curr: "KES",
            cbk: "http://example.com",
            cst: "0",
            crl: "2"),
        "https://payments.ipayafrica.com/v3/ke?live=1&oid=123&inv=123&ttl=1&tel=0711111111&eml=example@example.com&vid=demo&curr=KES&p1=&p2=&p3=&p4=&cbk=http://example.com&cst=0&crl=2&hsh=939d78d22dfe37c2a76bb6acc06d84c51ef3d331&autopay=0");
  });
}
