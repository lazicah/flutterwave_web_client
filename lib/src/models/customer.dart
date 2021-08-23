import 'package:flutterwave_web_client/src/js/flutterwave_stub.dart'
    if (dart.library.js) 'package:flutterwave_web_client/src/js/flutterwave_js.dart'
    as js;

class FlutterwaveCustomer {
  final String email;
  final String phoneNumber;
  final String name;

  FlutterwaveCustomer(this.email, this.phoneNumber, this.name);

  factory FlutterwaveCustomer.fromJS(js.FlutterwaveCustomer customer) {
    return FlutterwaveCustomer(
        customer.email, customer.phone_number, customer.name);
  }
}
