import 'customer.dart';
import 'customization.dart';

class Charge {
  String? reference;
  int amount = 0;
  String? currency;
  String? country;
  String? paymentOptions;
  String? redirectUrl;
  FlutterwaveCustomer? customer;
  FlutterwaveCustomizations? customizations;

  Charge() {
    this.amount = -1;
    this.currency = 'NGN';
  }
}
