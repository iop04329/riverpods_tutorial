// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

info _$infoFromJson(Map<String, dynamic> json) {
  return _info.fromJson(json);
}

/// @nodoc
mixin _$info {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get gender => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $infoCopyWith<info> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $infoCopyWith<$Res> {
  factory $infoCopyWith(info value, $Res Function(info) then) =
      _$infoCopyWithImpl<$Res, info>;
  @useResult
  $Res call({int id, String name, int gender, String date});
}

/// @nodoc
class _$infoCopyWithImpl<$Res, $Val extends info>
    implements $infoCopyWith<$Res> {
  _$infoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? gender = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$infoImplCopyWith<$Res> implements $infoCopyWith<$Res> {
  factory _$$infoImplCopyWith(
          _$infoImpl value, $Res Function(_$infoImpl) then) =
      __$$infoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, int gender, String date});
}

/// @nodoc
class __$$infoImplCopyWithImpl<$Res>
    extends _$infoCopyWithImpl<$Res, _$infoImpl>
    implements _$$infoImplCopyWith<$Res> {
  __$$infoImplCopyWithImpl(_$infoImpl _value, $Res Function(_$infoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? gender = null,
    Object? date = null,
  }) {
    return _then(_$infoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$infoImpl implements _info {
  _$infoImpl(
      {required this.id, this.name = '', this.gender = 0, required this.date});

  factory _$infoImpl.fromJson(Map<String, dynamic> json) =>
      _$$infoImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int gender;
  @override
  final String date;

  @override
  String toString() {
    return 'info(id: $id, name: $name, gender: $gender, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$infoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, gender, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$infoImplCopyWith<_$infoImpl> get copyWith =>
      __$$infoImplCopyWithImpl<_$infoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$infoImplToJson(
      this,
    );
  }
}

abstract class _info implements info {
  factory _info(
      {required final int id,
      final String name,
      final int gender,
      required final String date}) = _$infoImpl;

  factory _info.fromJson(Map<String, dynamic> json) = _$infoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get gender;
  @override
  String get date;
  @override
  @JsonKey(ignore: true)
  _$$infoImplCopyWith<_$infoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
