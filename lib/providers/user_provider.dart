import 'package:flutter/foundation.dart';
import 'package:tixket/data/user_data.dart';
import 'package:tixket/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  User? _currentUser;
  User? get currentUser => _currentUser;

  void addUser(User user) {
    _currentUser = user;
    users.add(user);
    notifyListeners();
  }

  void setUser(User user) {
    _currentUser = user;
    notifyListeners();
  }

  void logOut() {
    _currentUser = null;
    notifyListeners();
  }

  void delete() {
    users.remove(_currentUser);
    _currentUser = null;
    notifyListeners();
  }

  void updatePassword(String newPassword) {
    int index = users.indexOf(currentUser!);
    if(index == -1) return;
    users[index].password = newPassword;
    notifyListeners();
  }

  void updateName(String newName) {
    int index = users.indexOf(currentUser!);
    if(index == -1) return;
    users[index].name = newName;
    notifyListeners();
  }

  void updateUsername(String newUsername) {
    int index = users.indexOf(currentUser!);
    if(index == -1) return;
    users[index].username = newUsername;
    notifyListeners();
  }

  void updateEmail(String newEmail) {
    int index = users.indexOf(currentUser!);
    if(index == -1) return;
    users[index].email = newEmail;
    notifyListeners();
  }

  void updateImage(Uint8List newImage) {
    int index = users.indexOf(currentUser!);
    if(index == -1) return;
    users[index].profilePicture = newImage;
    notifyListeners();
  }
}