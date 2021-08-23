Handler FlutterwaveCheckout(CheckoutData data) => throw UnimplementedError(
    'Make sure you are using this on the web and have added the js library ');

abstract class Handler {
  void close();
}

class CheckoutData {
  String public_key;
  String tx_ref;
  int amount;
  String currency;
  String country;
  String? payment_options;
  String? redirect_url;
  FlutterwaveCustomer? customer;
  FlutterwaveCallback? callback;
  // VoidCallback? onclose;
  FlutterwaveCustomizations? customizations;

  CheckoutData({
    required this.public_key,
    required this.tx_ref,
    required this.amount,
    required this.currency,
    required this.country,
    this.payment_options,
    this.redirect_url,
    this.customer,
    this.callback,
    // this.onclose,
    this.customizations,
  });
}

class FlutterwaveCustomer {
  FlutterwaveCustomer({
    required this.email,
    required this.phone_number,
    required this.name,
  });
  String email;
  String phone_number;
  String name;
}

class FlutterwaveCustomizations {
  FlutterwaveCustomizations({
    required this.title,
    required this.description,
    required this.logo,
  });
  String title;
  String description;
  String logo;
}

class RaveResult {
  int amount;

  RaveResult(this.amount, this.currency, this.customer, this.flw_ref,
      this.status, this.tx_ref, this.transaction_id);

  String currency;
  FlutterwaveCustomer customer;
  String flw_ref;
  String status;
  String tx_ref;
  int transaction_id;
}

typedef FlutterwaveCallback(RaveResult response);
