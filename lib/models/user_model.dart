class User {
  String username;
  String email;
  String name;
  String password;
  String profilePicture;
  Map<String, bool> notification;

  User({
    required this.username,
    required this.password,
    required this.email,
    this.name = "",
    this.profilePicture = "",
    this.notification = const {
      "Selected App Application" : true,
      "Selected Recommended Movies Notification" : true,
      "Selected Updated Movies Notification" : true,
    },
  });
}
