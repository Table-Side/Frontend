import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';
part 'account.g.dart';

/// A users [Account]
@immutable
@freezed
class Account with _$Account {
  const Account._();

  const factory Account({
    required String id,
    required String name,
    required String email,
    required List<String> roles,
  }) = _Account;

  factory Account.fromJson(final Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  bool hasRole(String role) => roles.contains(role);

  bool isRestaurantOwner() => hasRole('restaurant');
  bool isCustomer() => hasRole('customer');
}
