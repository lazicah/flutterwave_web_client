import 'package:flutterwave_web_client/src/js/flutterwave_stub.dart'
    if (dart.library.js) 'package:flutterwave_web_client/src/js/flutterwave_js.dart'
    as js;

class FlutterwaveCustomizations {
  final String title;
  final String description;
  final String logo;

  FlutterwaveCustomizations(this.title, this.description, this.logo);

  factory FlutterwaveCustomizations.fromJS(
      js.FlutterwaveCustomizations custom) {
    return FlutterwaveCustomizations(
        custom.title, custom.description, custom.logo);
  }
}
