import 'package:tixket/data/user_data.dart';

class UpdateUserDetail {
  int findUser(String text) {
    for(int i = 0; i < users.length; i++) {
      if(users[i].username == text || users[i].email == text) {
        return i;
      }
    }

    return -1;
  }

  void updateNotification(String text, Map<String, bool> newNotification) {
    int index = findUser(text);
    if(index == -1) return;
    users[index].notification = newNotification;
  }

  void updatePassword(String text, String newPassword) {
    int index = findUser(text);
    if(index == -1) return;
    users[index].password = newPassword;
  }

  void updateName(String text, String newName) {
    int index = findUser(text);
    if(index == -1) return;
    users[index].name = newName;
  }

  void updateUsername(String text, String newUsername) {
    int index = findUser(text);
    if(index == -1) return;
    users[index].username = newUsername;
  }

  void updateEmail(String text, String newEmail) {
    int index = findUser(text);
    if(index == -1) return;
    users[index].email = newEmail;
  }
}
