class User {
  String username;
  String password;

  User({
    required this.username,
    required this.password
  });
}

List<User> users = [
  User(
    username: "mantacore",
    password: "123456"
  )
];