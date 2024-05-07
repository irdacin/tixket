class User {
  String username;
  String password;
  String profilePicture;
  Map<String, bool> notificationProvider;

  User({
    required this.username,
    required this.password,
    this.profilePicture = "profile-picture.png",
    this.notificationProvider = const {
      "Selected App Application" : true,
      "Selected Recommended Movies Notification" : true,
      "Selected Updated Movies Notification" : true,
    },
  });
}

List<User> users = [
  User(
    username: "mantacore",
    password: "123456",
  )
];