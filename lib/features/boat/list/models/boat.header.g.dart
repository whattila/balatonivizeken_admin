// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boat.header.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BoatHeaderDtoImpl _$$BoatHeaderDtoImplFromJson(Map<String, dynamic> json) =>
    _$BoatHeaderDtoImpl(
      id: json['_id'] as String?,
      boatType: BoatTypeExtension.fromString(json['boatType'] as String),
      displayName: json['displayName'] as String,
    );

Map<String, dynamic> _$$BoatHeaderDtoImplToJson(_$BoatHeaderDtoImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'boatType': _$BoatTypeEnumMap[instance.boatType]!,
      'displayName': instance.displayName,
    };

const _$BoatTypeEnumMap = {
  BoatType.waterSportsEquipment: 'waterSportsEquipment',
  BoatType.smallBoat: 'smallBoat',
  BoatType.licensedBoat: 'licensedBoat',
};
