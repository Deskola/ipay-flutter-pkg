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
            ttl: "20,200.05",
            tel: "+254711111111",
            eml: "example@example.com",
            curr: "KES",
            cbk: "http://example.com",
            cst: "0",
            crl: "2",
            mpesa: "1",
            bonga: "1",
            equity: "1",
            airtel: "1",
            creditcard: "0",
            mobilebanking: "1",
            mkoporahisi: "1",
            saida: "1",
            vooma: "0",
            mvisa: "1",
            elipa: "1",
            unionpay: "1",
            pesalink: "1",
            autopay: "1"),
        "https://payments.ipayafrica.com/v3/ke?live=1&oid=123&inv=123&ttl=20200&tel=254711111111&eml=example@example.com&vid=demo&curr=KES&p1=&p2=&p3=&p4=&cbk=http://example.com&cst=0&crl=2&hsh=fb4c25216a98aa2ab6170bdf4162d48e7bda6f4e&mpesa=1&bonga=1&airtel=1&equity=1&creditcard=0&mobilebanking=1&mkoporahisi=1&saida=1&elipa=1&unionpay=1&mvisa=1&vooma=0&pesalink=1&autopay=1");
  });
}
