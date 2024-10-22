// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.header.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserHeaderDto _$UserHeaderDtoFromJson(Map<String, dynamic> json) {
  return _UserHeaderDto.fromJson(json);
}

/// @nodoc
mixin _$UserHeaderDto {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(fromJson: UserTypeExtension.fromString)
  UserType get userType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserHeaderDtoCopyWith<UserHeaderDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserHeaderDtoCopyWith<$Res> {
  factory $UserHeaderDtoCopyWith(
          UserHeaderDto value, $Res Function(UserHeaderDto) then) =
      _$UserHeaderDtoCopyWithImpl<$Res, UserHeaderDto>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      String username,
      String phoneNumber,
      @JsonKey(fromJson: UserTypeExtension.fromString) UserType userType});
}

/// @nodoc
class _$UserHeaderDtoCopyWithImpl<$Res, $Val extends UserHeaderDto>
    implements $UserHeaderDtoCopyWith<$Res> {
  _$UserHeaderDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = null,
    Object? phoneNumber = null,
    Object? userType = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as UserType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserHeaderDtoImplCopyWith<$Res>
    implements $UserHeaderDtoCopyWith<$Res> {
  factory _$$UserHeaderDtoImplCopyWith(
          _$UserHeaderDtoImpl value, $Res Function(_$UserHeaderDtoImpl) then) =
      __$$UserHeaderDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      String username,
      String phoneNumber,
      @JsonKey(fromJson: UserTypeExtension.fromString) UserType userType});
}

/// @nodoc
class __$$UserHeaderDtoImplCopyWithImpl<$Res>
    extends _$UserHeaderDtoCopyWithImpl<$Res, _$UserHeaderDtoImpl>
    implements _$$UserHeaderDtoImplCopyWith<$Res> {
  __$$UserHeaderDtoImplCopyWithImpl(
      _$UserHeaderDtoImpl _value, $Res Function(_$UserHeaderDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = null,
    Object? phoneNumber = null,
    Object? userType = null,
  }) {
    return _then(_$UserHeaderDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as UserType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserHeaderDtoImpl implements _UserHeaderDto {
  const _$UserHeaderDtoImpl(
      {@JsonKey(name: "_id") required this.id,
      required this.username,
      required this.phoneNumber,
      @JsonKey(fromJson: UserTypeExtension.fromString) required this.userType});

  factory _$UserHeaderDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserHeaderDtoImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  final String username;
  @override
  final String phoneNumber;
  @override
  @JsonKey(fromJson: UserTypeExtension.fromString)
  final UserType userType;

  @override
  String toString() {
    return 'UserHeaderDto(id: $id, username: $username, phoneNumber: $phoneNumber, userType: $userType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserHeaderDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.userType, userType) ||
                other.userType == userType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, username, phoneNumber, userType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserHeaderDtoImplCopyWith<_$UserHeaderDtoImpl> get copyWith =>
      __$$UserHeaderDtoImplCopyWithImpl<_$UserHeaderDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserHeaderDtoImplToJson(
      this,
    );
  }
}

abstract class _UserHeaderDto implements UserHeaderDto {
  const factory _UserHeaderDto(
      {@JsonKey(name: "_id") required final String? id,
      required final String username,
      required final String phoneNumber,
      @JsonKey(fromJson: UserTypeExtension.fromString)
      required final UserType userType}) = _$UserHeaderDtoImpl;

  factory _UserHeaderDto.fromJson(Map<String, dynamic> json) =
      _$UserHeaderDtoImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  String get username;
  @override
  String get phoneNumber;
  @override
  @JsonKey(fromJson: UserTypeExtension.fromString)
  UserType get userType;
  @override
  @JsonKey(ignore: true)
  _$$UserHeaderDtoImplCopyWith<_$UserHeaderDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
