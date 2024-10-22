// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.header.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserHeaderDtoImpl _$$UserHeaderDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserHeaderDtoImpl(
      id: json['_id'] as String?,
      username: json['username'] as String,
      phoneNumber: json['phoneNumber'] as String,
      userType: UserTypeExtension.fromString(json['userType'] as String),
    );

Map<String, dynamic> _$$UserHeaderDtoImplToJson(_$UserHeaderDtoImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'phoneNumber': instance.phoneNumber,
      'userType': _$UserTypeEnumMap[instance.userType]!,
    };

const _$UserTypeEnumMap = {
  UserType.normal: 'normal',
  UserType.lifeguard: 'lifeguard',
  UserType.admin: 'admin',
};
