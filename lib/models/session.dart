import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@immutable
@freezed
class Session with _$Session {
  const Session._();

  const factory Session({
    required String accessToken,
    required String refreshToken,
  }) = _Session;

  factory Session.fromJson(final Map<String, dynamic> json) =>
      _$SessionFromJson(json);
}
