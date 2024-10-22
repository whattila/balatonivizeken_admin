// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boat.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BoatDtoImpl _$$BoatDtoImplFromJson(Map<String, dynamic> json) =>
    _$BoatDtoImpl(
      id: json['_id'] as String?,
      userId: json['userId'] as String,
      boatType: BoatTypeExtension.fromString(json['boatType'] as String),
      displayName: json['displayName'] as String,
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      gpsEnabled: json['gpsEnabled'] as bool,
      boatColor: json['boatColor'] as String?,
    );

Map<String, dynamic> _$$BoatDtoImplToJson(_$BoatDtoImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'boatType': _$BoatTypeEnumMap[instance.boatType]!,
      'displayName': instance.displayName,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'gpsEnabled': instance.gpsEnabled,
      'boatColor': instance.boatColor,
    };

const _$BoatTypeEnumMap = {
  BoatType.waterSportsEquipment: 'waterSportsEquipment',
  BoatType.smallBoat: 'smallBoat',
  BoatType.licensedBoat: 'licensedBoat',
};
