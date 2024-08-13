<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

iPay Checkout gateway is flutter package to enable businesses easily integrate with iPay payment solution. The package is dynamic to enable business to choose which payment
channels they'd like to show their customers. 

## Features

1) Generate Checkout URL that is be used in webview to access iPay multi-channel payment gateway e.g Mpesa, Mpesa Express, Vooma, Amex, Visa/Mastercard, Union Pay, Airtel money, Equitel, Bonga and more.

2) Dynamically enable payment channels as per your business need.

## Getting started



## Usage

#### Import the iPay package
```dart
import 'package:ipaycheckout/ipaycheckout.dart'; 
```

#### Then intialize the Ipay class object. it takes two arguments, vendorId and vendorSecurityKey (these are supplied to you by iPay)
```dart
final ipay = IPay(vendorId: vendorId, vendorSecurityKey: securityKey);
```

#### Then the call the chekoutUrl fuction wich takes the following arguments:
live, oid, inv, ttl, tel, eml, curr, cbk, cst, crl.
Refere to iPay documentation for more details https://dev.ipayafrica.com
```dart
Future<String> generateUrl(
      String phoneNumber, String email, String amount) async {
    final ipay = IPay(vendorId: vendorId, vendorSecurityKey: securityKey);
    var oid = getRandomString(10);
    var inv = oid;
    var url = ipay.checkoutUrl(
        live: live,
        oid: oid,
        inv: inv,
        ttl: amount,
        tel: phoneNumber,
        eml: email,
        curr: currency,
        cbk: callBackUrl,
        cst: cst,
        crl: crl,

        //enable the channels you need 
        mpesa: mpesa,
        bonga: bonga,
        airtel: airtel,
        equity: equity,
        mobilebanking: mobilebanking,
        creditcard: creditcard,
        mkoporahisi: mkoporahisi,
        saida: saida,
        elipa: elipa,
        unionpay: unionpay,
        mvisa: mvisa,
        vooma: vooma,
        pesalink: pesalink,
        autopay: autopay,

        //enable card recurring payment. By default it's disabled 
        recurring: recurring
      );

    return url;
  }
```

### This will generate a URL that can be embedded in a webview  to facilitate payment using iPay multi-channel payment gateway.

## Recurring Payment and Card Tokenization (NEW)
Recurring Payment enable the customer card to be tokenized and this enable the business to set frequency of payment.

### Note
1. the recurring value is either a true or false.
2. If Recurring is enabled, only card channels will be available i.e. VISA/MASTERCARD

## Example
https://github.com/Deskola/ipay-flutter-lib-implem

.
