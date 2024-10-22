// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegistrationDto _$RegistrationDtoFromJson(Map<String, dynamic> json) {
  return _RegistrationDto.fromJson(json);
}

/// @nodoc
mixin _$RegistrationDto {
  String get username => throw _privateConstructorUsedError;
  String get emailAddress => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get familyName => throw _privateConstructorUsedError;
  String get givenName => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  UserType get userType => throw _privateConstructorUsedError;
  String? get invitationCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegistrationDtoCopyWith<RegistrationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationDtoCopyWith<$Res> {
  factory $RegistrationDtoCopyWith(
          RegistrationDto value, $Res Function(RegistrationDto) then) =
      _$RegistrationDtoCopyWithImpl<$Res, RegistrationDto>;
  @useResult
  $Res call(
      {String username,
      String emailAddress,
      String password,
      String familyName,
      String givenName,
      String phoneNumber,
      UserType userType,
      String? invitationCode});
}

/// @nodoc
class _$RegistrationDtoCopyWithImpl<$Res, $Val extends RegistrationDto>
    implements $RegistrationDtoCopyWith<$Res> {
  _$RegistrationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? emailAddress = null,
    Object? password = null,
    Object? familyName = null,
    Object? givenName = null,
    Object? phoneNumber = null,
    Object? userType = null,
    Object? invitationCode = freezed,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      familyName: null == familyName
          ? _value.familyName
          : familyName // ignore: cast_nullable_to_non_nullable
              as String,
      givenName: null == givenName
          ? _value.givenName
          : givenName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as UserType,
      invitationCode: freezed == invitationCode
          ? _value.invitationCode
          : invitationCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegistrationDtoImplCopyWith<$Res>
    implements $RegistrationDtoCopyWith<$Res> {
  factory _$$RegistrationDtoImplCopyWith(_$RegistrationDtoImpl value,
          $Res Function(_$RegistrationDtoImpl) then) =
      __$$RegistrationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String username,
      String emailAddress,
      String password,
      String familyName,
      String givenName,
      String phoneNumber,
      UserType userType,
      String? invitationCode});
}

/// @nodoc
class __$$RegistrationDtoImplCopyWithImpl<$Res>
    extends _$RegistrationDtoCopyWithImpl<$Res, _$RegistrationDtoImpl>
    implements _$$RegistrationDtoImplCopyWith<$Res> {
  __$$RegistrationDtoImplCopyWithImpl(
      _$RegistrationDtoImpl _value, $Res Function(_$RegistrationDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? emailAddress = null,
    Object? password = null,
    Object? familyName = null,
    Object? givenName = null,
    Object? phoneNumber = null,
    Object? userType = null,
    Object? invitationCode = freezed,
  }) {
    return _then(_$RegistrationDtoImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      familyName: null == familyName
          ? _value.familyName
          : familyName // ignore: cast_nullable_to_non_nullable
              as String,
      givenName: null == givenName
          ? _value.givenName
          : givenName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as UserType,
      invitationCode: freezed == invitationCode
          ? _value.invitationCode
          : invitationCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegistrationDtoImpl implements _RegistrationDto {
  const _$RegistrationDtoImpl(
      {required this.username,
      required this.emailAddress,
      required this.password,
      required this.familyName,
      required this.givenName,
      required this.phoneNumber,
      required this.userType,
      required this.invitationCode});

  factory _$RegistrationDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegistrationDtoImplFromJson(json);

  @override
  final String username;
  @override
  final String emailAddress;
  @override
  final String password;
  @override
  final String familyName;
  @override
  final String givenName;
  @override
  final String phoneNumber;
  @override
  final UserType userType;
  @override
  final String? invitationCode;

  @override
  String toString() {
    return 'RegistrationDto(username: $username, emailAddress: $emailAddress, password: $password, familyName: $familyName, givenName: $givenName, phoneNumber: $phoneNumber, userType: $userType, invitationCode: $invitationCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationDtoImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.emailAddress, emailAddress) ||
                other.emailAddress == emailAddress) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.familyName, familyName) ||
                other.familyName == familyName) &&
            (identical(other.givenName, givenName) ||
                other.givenName == givenName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.invitationCode, invitationCode) ||
                other.invitationCode == invitationCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, username, emailAddress, password,
      familyName, givenName, phoneNumber, userType, invitationCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationDtoImplCopyWith<_$RegistrationDtoImpl> get copyWith =>
      __$$RegistrationDtoImplCopyWithImpl<_$RegistrationDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegistrationDtoImplToJson(
      this,
    );
  }
}

abstract class _RegistrationDto implements RegistrationDto {
  const factory _RegistrationDto(
      {required final String username,
      required final String emailAddress,
      required final String password,
      required final String familyName,
      required final String givenName,
      required final String phoneNumber,
      required final UserType userType,
      required final String? invitationCode}) = _$RegistrationDtoImpl;

  factory _RegistrationDto.fromJson(Map<String, dynamic> json) =
      _$RegistrationDtoImpl.fromJson;

  @override
  String get username;
  @override
  String get emailAddress;
  @override
  String get password;
  @override
  String get familyName;
  @override
  String get givenName;
  @override
  String get phoneNumber;
  @override
  UserType get userType;
  @override
  String? get invitationCode;
  @override
  @JsonKey(ignore: true)
  _$$RegistrationDtoImplCopyWith<_$RegistrationDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
