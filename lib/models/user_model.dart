import 'package:flutter/foundation.dart';

class User {
  String username;
  String email;
  String name;
  String password;
  Uint8List? profilePicture;
  Map<String, bool>? notification;

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
