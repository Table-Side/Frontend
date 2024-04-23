// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Api<T> _$ApiFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _Api<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$Api<T> {
  T get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiCopyWith<T, Api<T>> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiCopyWith<T, $Res> {
  factory $ApiCopyWith(Api<T> value, $Res Function(Api<T>) then) =
      _$ApiCopyWithImpl<T, $Res, Api<T>>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class _$ApiCopyWithImpl<T, $Res, $Val extends Api<T>>
    implements $ApiCopyWith<T, $Res> {
  _$ApiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiImplCopyWith<T, $Res> implements $ApiCopyWith<T, $Res> {
  factory _$$ApiImplCopyWith(
          _$ApiImpl<T> value, $Res Function(_$ApiImpl<T>) then) =
      __$$ApiImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$ApiImplCopyWithImpl<T, $Res>
    extends _$ApiCopyWithImpl<T, $Res, _$ApiImpl<T>>
    implements _$$ApiImplCopyWith<T, $Res> {
  __$$ApiImplCopyWithImpl(
      _$ApiImpl<T> _value, $Res Function(_$ApiImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$ApiImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$ApiImpl<T> implements _Api<T> {
  const _$ApiImpl({required this.data});

  factory _$ApiImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$ApiImplFromJson(json, fromJsonT);

  @override
  final T data;

  @override
  String toString() {
    return 'Api<$T>(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiImplCopyWith<T, _$ApiImpl<T>> get copyWith =>
      __$$ApiImplCopyWithImpl<T, _$ApiImpl<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$ApiImplToJson<T>(this, toJsonT);
  }
}

abstract class _Api<T> implements Api<T> {
  const factory _Api({required final T data}) = _$ApiImpl<T>;

  factory _Api.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$ApiImpl<T>.fromJson;

  @override
  T get data;
  @override
  @JsonKey(ignore: true)
  _$$ApiImplCopyWith<T, _$ApiImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
