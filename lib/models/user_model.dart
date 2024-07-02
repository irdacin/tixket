import 'package:flutter/foundation.dart';
import 'package:tixket/models/payment_method_model.dart';

class User {
  String username;
  String email;
  String name;
  String password;
  Uint8List? profilePicture;
  Map<String, bool>? notification;
  PaymentMethod? paymentMethod;

  User({
    required this.username,
    required this.password,
    required this.email,
    this.name = "",
    this.profilePicture,
    this.notification
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! User) {
      return false;
    }
    return username == other.username;
  }

  @override
  int get hashCode => username.hashCode;
}
