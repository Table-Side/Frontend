// part 'user_details.g.dart';

class UserDetails {
  final String id;
  final String name;
  final String email;
  final List<String> roles;

  UserDetails({
    required this.id,
    required this.name,
    required this.email,
    required this.roles,
  });
}

// @freezed
// class User with _$User {
//   const User._();
//
//   @FreezedUnionValue('User')
//   const factory User({
//     required String id,
//     required String email,
//     required String role,
//     required String givenName,
//     required String familyName,
//   }) = _User;
//
//   factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
// }

// @freezed
// class User with _$User {
//   const factory User({
//     required final String id,
//     required final String email,
//     // required final String password,
//     required final String role,
//     required final String givenName,
//     required final String familyName,
//     // String? accessToken,
//   }) = _User;
//
//   factory User.fromJson(final Map<String, dynamic> json) =>
//       _$UserFromJson(json);
// }

// @freezed
// class User with _$User {
//   const factory User({
//     required final String id,
//     required final String email,
//     required final String password,
//     required final String role,
//     required final String givenName,
//     required final String familyName,
//     // final Profile? profile,
//   }) = _User;
//
//   factory User.fromJson(final Map<String, dynamic> json) =>
//       _$UserFromJson(json);
// }
//
// @freezed
// class Profile with _$Profile {
//   const factory Profile({
//     required final String id,
//     required final String userId,
//     required final String firstName,
//     required final String lastName,
//   }) = _Profile;
//
//   factory Profile.fromJson(final Map<String, dynamic> json) =>
//       _$ProfileFromJson(json);
// }
