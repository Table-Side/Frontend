import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

// class User {
//   final String id;
//   final String email;
//   final String password;
//   final String role;
//   final Profile? profile;
//
//   User({
//     required this.id,
//     required this.email,
//     required this.password,
//     required this.role,
//     this.profile,
//   });
// }

@freezed
class User with _$User {
  const factory User({
    required final String id,
    required final String email,
    required final String password,
    required final String role,
    final Profile? profile,
  }) = _User;

  factory User.fromJson(final Map<String, dynamic> json) =>
      _$UserFromJson(json);
}

// class Profile {
//   String id;
//   String userId;
//   String firstName;
//   String lastName;
//
//   Profile({
//     required this.id,
//     required this.userId,
//     required this.firstName,
//     required this.lastName,
//   });
// }

@freezed
class Profile with _$Profile {
  const factory Profile({
    required final String id,
    required final String userId,
    required final String firstName,
    required final String lastName,
  }) = _Profile;

  factory Profile.fromJson(final Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}
