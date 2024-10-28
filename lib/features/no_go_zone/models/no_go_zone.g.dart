// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'no_go_zone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoGoZoneImpl _$$NoGoZoneImplFromJson(Map<String, dynamic> json) =>
    _$NoGoZoneImpl(
      id: json['_id'] as String?,
      zonePoints: (json['zonePoints'] as List<dynamic>)
          .map((e) => LocationDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$NoGoZoneImplToJson(_$NoGoZoneImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'zonePoints': instance.zonePoints,
    };
