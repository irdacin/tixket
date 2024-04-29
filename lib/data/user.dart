class User {
  String username;
  String password;
  String profilePicture;

  User({
    required this.username,
    required this.password,
    this.profilePicture = "profile-picture.png"
  });
}

List<User> users = [
  User(
    username: "mantacore",
    password: "123456"
  )
];