// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInfoDtoImpl _$$UserInfoDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoDtoImpl(
      id: json['_id'] as String?,
      username: json['username'] as String,
      emailAddress: json['emailAddress'] as String,
      familyName: json['familyName'] as String,
      givenName: json['givenName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      userType: UserTypeExtension.fromString(json['userType'] as String),
    );

Map<String, dynamic> _$$UserInfoDtoImplToJson(_$UserInfoDtoImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'emailAddress': instance.emailAddress,
      'familyName': instance.familyName,
      'givenName': instance.givenName,
      'phoneNumber': instance.phoneNumber,
      'userType': _$UserTypeEnumMap[instance.userType]!,
    };

const _$UserTypeEnumMap = {
  UserType.normal: 'normal',
  UserType.lifeguard: 'lifeguard',
  UserType.admin: 'admin',
};
