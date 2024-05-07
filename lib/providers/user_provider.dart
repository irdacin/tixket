import 'package:flutter/material.dart';
import 'package:tixket/data/user.dart';

class UserProvider extends ChangeNotifier {
  User? _currentUser;
  User? get currentUser => _currentUser;

  validateUsername(String value) {
    if(value.isEmpty) {
      return "Username is required";
    } else {
      return null;
    }
  }

  validatePassword(String value) {
    if(value.isEmpty) {
      return "Password is required";
    } else if(value.length < 6) {
      return "Password must contain at least 6 character";
    } else {
      return null;
    }
  }

  validateConfirmPassword(String value, String passwordValue) {
    if(value.isEmpty) {
      return "Confirm Password is required";
    } else if (value != passwordValue) {
      return "Password does not match";
    } else {
      return null;
    }
  }

  bool validateUserSignUp(String value) {
    for(User user in users) {
      if(value == user.username) {
        return true;
      }
    }

    return false;
  }

  bool validateUserLogin(String username, String password) {
     for(User user in users) {
      if(username == user.username && password == user.password) {
        return false;
      }
    }

    return true;
  }

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