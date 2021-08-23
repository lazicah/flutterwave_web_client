# flutterwave_web_client

A Flutter wrapper of the Flutterwave inline payment

<p>
    <img src="https://raw.githubusercontent.com/lazicah/flutterwave_web_client/master/screenshots/web.png" width="400px" height="auto" hspace="20"/>
</p>

A Flutter plugin for making payments via Flutterwave Payment Gateway. Supports web only

## :rocket: Installation

To use this plugin, add `flutterwave_web_client` as
a [dependency in your pubspec.yaml file](https://flutter.dev/platform-plugins/).

Then initialize the plugin preferably in the `initState` of your widget.

``` dart
import 'package:flutterwave_web_client/flutterwave_web_client.dart';

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    FlutterwaveWebClient.initialize(
        'PUBLIC KEY GOES HERE');
    super.initState();
  }
}
```

### Web
Include the Flutterwave JS script in your index.html file
```
<script src="https://checkout.flutterwave.com/v3.js"></script>
```

### Usage
 ```dart
    void _makePayment() async {
     final customer =
         FlutterwaveCustomer('lazicah@gmail.com', '08102894804', 'Lazarus');
     final charge = new Charge()
       ..amount = 100
       ..reference = 'test'
       ..currency = 'NGN'
       ..country = 'NG'
       ..customer = customer;

     final response = await FlutterwaveWebClient.checkout(charge: charge);
     if (response.status) {
       print('Successful, Transaction ref ${response.tx_ref}');
     } else {
       print('Transaction failed');
     }
   }
 ```

It is recommended that when `FlutterwaveWebClient.checkout()` returns, the
payment should be verified on your backend.