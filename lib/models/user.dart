class User {
  final String id;
  final String email;
  final String password;
  final String role;
  final Profile? profile;

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.role,
    this.profile,
  });
}

class Profile {
  String id;
  String userId;
  String firstName;
  String lastName;

  Profile({
    required this.id,
    required this.userId,
    required this.firstName,
    required this.lastName,
  });
}
