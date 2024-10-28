// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationDtoImpl _$$LocationDtoImplFromJson(Map<String, dynamic> json) =>
    _$LocationDtoImpl(
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$LocationDtoImplToJson(_$LocationDtoImpl instance) =>
    <String, dynamic>{
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };
