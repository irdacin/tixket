import 'package:flutter/material.dart';
import 'package:tixket/data/user_data.dart';
import 'package:tixket/models/user_model.dart';

User? currentUser;

class UserProvider extends ChangeNotifier {
  void addUser(User user) {
    currentUser = user;
    users.add(user);
    notifyListeners();
  }

  void setUser(User user) {
    currentUser = user;
    notifyListeners();
  }

  void logOut() {
    currentUser = null;
    notifyListeners();
  }

  void delete() {
    users.remove(currentUser);
    currentUser = null;
    notifyListeners();
  }
}