import 'package:flutter/material.dart';
import 'package:tixket/data/user.dart';

class UserProvider extends ChangeNotifier {
  User? _currentUser;
  User? get currentUser => _currentUser;

  void addUser(User user) {
    _currentUser = user;
    users.add(user);
    notifyListeners();
  }

  void setUser(User user) {
    for(User u in users) {
      if(u.username == user.username) {
        _currentUser = u;
        break;
      }
    }
    notifyListeners();
  }

}