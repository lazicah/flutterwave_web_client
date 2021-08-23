@JS()
library flutterwave_js;

import 'package:js/js.dart';

@JS('FlutterwaveCheckout')
external Handler FlutterwaveCheckout(CheckoutData data);

@JS()
@anonymous
class Handler {
  external void close();
}

@JS()
@anonymous
class CheckoutData {
  external String public_key;
  external String tx_ref;
  external int amount;
  external String currency;
  external String country;
  external String payment_options;
  external String redirect_url;
  external FlutterwaveCustomer customer;
  external FlutterwaveCallback callback;
  // external VoidCallback onclose;
  external FlutterwaveCustomizations customizations;

  external factory CheckoutData({
    required String public_key,
    required String tx_ref,
    required int amount,
    required String currency,
    required String country,
    String? payment_options,
    String? redirect_url,
    FlutterwaveCustomer? customer,
    FlutterwaveCallback? callback,
    // VoidCallback? onclose,
    FlutterwaveCustomizations? customizations,
  });
}

@JS()
@anonymous
class FlutterwaveCustomer {
  external factory FlutterwaveCustomer({
    required String email,
    required String phone_number,
    required String name,
  });
  external String email;
  external String phone_number;
  external String name;
}

@JS()
@anonymous
class FlutterwaveCustomizations {
  external factory FlutterwaveCustomizations({
    required String title,
    required String description,
    required String logo,
  });
  external String title;
  external String description;
  external String logo;
}

@JS()
@anonymous
class RaveResult {
  external int amount;
  external String currency;
  external FlutterwaveCustomer customer;
  external String flw_ref;
  external String status;
  external String tx_ref;
  external int transaction_id;
}

typedef FlutterwaveCallback(RaveResult response);
