import 'package:chopper/chopper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api.freezed.dart';

part 'api.g.dart';

typedef RawResponseBody = Map<String, dynamic>;
typedef RawResponse = Response<RawResponseBody>;

@Freezed(genericArgumentFactories: true)
class Api<T> with _$Api<T> {
  const factory Api({
    required final T data,
  }) = _Api;

  factory Api.fromJson(final RawResponseBody json,
          final T Function(Object?) payloadFactory) =>
      _$ApiFromJson(json, (final payload) => payloadFactory(payload));

  static T unwrap<T>(
    final T Function(RawResponseBody) factory,
    final RawResponse response,
  ) {
    if (response.body == null) {
      if (null is T) return null as T;
      throw Exception(
          'Response body was null, but expected a non-nullable type.');
    }

    if (response.body!['data'] == null) {
      throw Exception(
          'Response data was null, but expected a non-nullable type.');
    }

    return Api<T>.fromJson(
      response.body!,
      (final data) => factory(data as RawResponseBody),
    ).data;
  }

  static List<T> unwrapList<T>(
    final T Function(RawResponseBody) factory,
    final RawResponse response,
  ) {
    if (response.body == null) {
      throw Exception(
        'Response body is null, but expected a non-nullable type.',
      );
    }

    if (response.body!['data'] == null) {
      throw Exception(
        "Response data for a list was null. It shouldn't be null.",
      );
    }

    return Api<List<T>>.fromJson(
      response.body!,
      (final data) =>
          (data as List).cast<Map<String, dynamic>>().map(factory).toList(),
    ).data;
  }
}
