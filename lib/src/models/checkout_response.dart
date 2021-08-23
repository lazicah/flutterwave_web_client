import 'customer.dart';

class CheckoutResponse {
  final int amount;
  final String currency;
  final FlutterwaveCustomer? customer;
  final String? flw_ref;
  final bool status;
  final String tx_ref;
  final int transaction_id;

  CheckoutResponse(
      {required this.amount,
      required this.currency,
      this.customer,
      this.flw_ref,
      required this.status,
      required this.tx_ref,
      required this.transaction_id});

  factory CheckoutResponse.defaults() {
    return CheckoutResponse(
        amount: -1,
        currency: '',
        status: false,
        tx_ref: '',
        transaction_id: -1);
  }
}
