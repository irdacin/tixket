import 'package:tixket/data/user_data.dart';
import 'package:tixket/models/user_model.dart';

class Validator {
  generalValidation(String value, String text) {
    if(value.isEmpty) {
      return "$text is required";
    } else {
      return null;
    }
  }

  validateUsername(String value) {
    if(value.isEmpty) {
      return "Username is required";
    } else {
      return null;
    }
  }

  validateEmail(String value) {
    RegExp emailRequirement = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if(value.isEmpty) {
      return "Email is required";
    } else if (!emailRequirement.hasMatch(value)) {
      return "Email is not valid";
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

  bool validateUsernameSignUp(String value) {
    for(User user in users) {
      if(value == user.username) {
        return true;
      }
    }

    return false;
  }

  bool validateEmailSignUp(String value) {
    for(User user in users) {
      if(value == user.email) {
        return true;
      }
    }

    return false;
  }

  validateUserLogin(String username, String password) {
    User? user = users.cast<User?>().firstWhere(
      (user) => (user?.username == username || user?.email == username) && user?.password == password, 
      orElse: () => null
    );

    return user;
  }

  bool checkPassword(String username, String password) {
    for(User user in users) {
      if(user.username == username && user.password == password) {
        return true;
      }
    }

    return false;
  }
}