// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'no_go_zone_input.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoGoZoneInputDtoImpl _$$NoGoZoneInputDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$NoGoZoneInputDtoImpl(
      id: json['_id'] as String?,
      zonePoints: (json['zonePoints'] as List<dynamic>)
          .map((e) => LocationDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$NoGoZoneInputDtoImplToJson(
        _$NoGoZoneInputDtoImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'zonePoints': instance.zonePoints,
    };
