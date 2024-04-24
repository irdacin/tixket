import 'package:flutter/material.dart';

class User {
  String username;
  String password;

  User({required this.username, required this.password});
}

class UserProvider extends ChangeNotifier {
  String _username = "";
  String get username => _username;

  List<User> users = [
    User(
      username: "Mantacore",
      password: "123"
    )
  ];

  validator(String value, String message) {
    if(value.isEmpty) {
      return message;
    } else {
      return null;
    }
  }

  void addUser(User user) {
    users.add(user);
    notifyListeners();
  }

  void setUser(User user){
    _username = user.username;
    notifyListeners();
  }

}