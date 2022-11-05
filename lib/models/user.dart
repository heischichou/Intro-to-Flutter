class User {
  String id;
  String firstName;
  String lastName;
  String address;
  String email;
  String password;
  String confirmPassword;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
}