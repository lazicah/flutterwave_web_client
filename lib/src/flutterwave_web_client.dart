import 'dart:async';

import 'package:flutter/services.dart';

import 'js/flutterwave_stub.dart' if (dart.library.js) 'js/flutterwave_js.dart';
import 'js/js_stub.dart' if (dart.library.js) 'package:js/js.dart';
import 'models/charge.dart';
import 'models/checkout_response.dart';
import 'models/customer.dart' as dt;

class FlutterwaveWebClient {
  static String? _publicKey;

  static Future<void> initialize(String publicKey) async {
    _publicKey = publicKey;
  }

  static Future<CheckoutResponse> checkout({
    required Charge charge,
  }) async {
    if (_publicKey == null || _publicKey!.isEmpty) {
      throw PlatformException(
        code: 'not-initialized',
        message: 'You are yet to initialize FlutterwaveClient',
      );
    }

    print('***Currency ${charge.currency}');
    print('***Country ${charge.country}');

    final completer = Completer<CheckoutResponse>();

    FlutterwaveCheckout(
      CheckoutData(
        public_key: _publicKey!,
        tx_ref: charge.reference!,
        amount: charge.amount,
        currency: charge.currency!,
        country: charge.country!,
        // onclose: allowInterop(() {
        //   print('modal is closed');
        //   completer.complete(CheckoutResponse.defaults());
        // }),
        customer: charge.customer != null
            ? FlutterwaveCustomer(
                email: charge.customer!.email,
                phone_number: charge.customer!.phoneNumber,
                name: charge.customer!.name)
            : null,
        customizations: charge.customizations != null
            ? FlutterwaveCustomizations(
                title: charge.customizations!.title,
                description: charge.customizations!.description,
                logo: charge.customizations!.logo)
            : null,
        redirect_url: charge.redirectUrl,
        callback: allowInterop((raveResult) {
          completer.complete(
            CheckoutResponse(
                status: raveResult.status == 'successful',
                currency: raveResult.currency,
                tx_ref: raveResult.tx_ref,
                amount: raveResult.amount,
                transaction_id: raveResult.transaction_id,
                customer: dt.FlutterwaveCustomer.fromJS(raveResult.customer)),
          );
        }),
      ),
    );

    return completer.future;
  }
}
