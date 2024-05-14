import 'package:flutter/material.dart';

class User with ChangeNotifier{
  String username;
  String password;
  String profilePicture;
  Map<String, bool> _notification;

  User({
    required this.username,
    required this.password,
    this.profilePicture = "profile-picture.png",
    Map<String, bool> notification = const {
      "Selected App Application" : true,
      "Selected Recommended Movies Notification" : true,
      "Selected Updated Movies Notification" : true,
    },
  }) : _notification = notification;

  Map<String, bool> get notification => _notification;
  
  void setNotification(Map<String, bool> value) {
    _notification = value;
  }
}

List<User> users = [
  User(
    username: "mantacore",
    password: "123456",
  )
];