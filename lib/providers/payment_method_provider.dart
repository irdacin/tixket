import 'package:flutter/material.dart';
import 'package:tixket/models/payment_method_model.dart';
import 'package:tixket/providers/user_provider.dart';

class PaymentMethodProvider extends ChangeNotifier {
  final UserProvider _userProvider;

  final List<PaymentMethod> _paymentMethods = [
    PaymentMethod(
      name: "Amazon Pay",
      fileName: "amazon-pay.png"
    ),
    PaymentMethod(
      name: "Credit Card", 
      fileName: "credit-card.png"
    ),
    PaymentMethod(
      name: "Gopay", 
      fileName: "gopay.png"
    ),
    PaymentMethod(
      name: "Paypal", 
      fileName: "paypal.png"
    ),
    PaymentMethod(
      name: "OVO", 
      fileName: "ovo.png"
    ),
    PaymentMethod(
      name: "DANA", 
      fileName: "dana.png"
    ),
  ];

  PaymentMethodProvider(this._userProvider);

  PaymentMethod? get selectedPaymentMethod => _userProvider.currentUser?.paymentMethod;
  List<PaymentMethod> get paymentMethods => _paymentMethods;

  void updatePaymentMethod(PaymentMethod method){
    _userProvider.currentUser?.paymentMethod = method;
    notifyListeners();
  }
}