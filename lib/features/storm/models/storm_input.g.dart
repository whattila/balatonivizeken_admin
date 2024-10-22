// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storm_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StormInputDtoImpl _$$StormInputDtoImplFromJson(Map<String, dynamic> json) =>
    _$StormInputDtoImpl(
      area: json['area'] as String,
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      date: json['date'] as String,
      degree: $enumDecode(_$StormDegreeEnumMap, json['degree']),
      windSpeed: (json['windSpeed'] as num).toInt(),
    );

Map<String, dynamic> _$$StormInputDtoImplToJson(_$StormInputDtoImpl instance) =>
    <String, dynamic>{
      'area': instance.area,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'date': instance.date,
      'degree': _$StormDegreeEnumMap[instance.degree]!,
      'windSpeed': instance.windSpeed,
    };

const _$StormDegreeEnumMap = {
  StormDegree.basic: 'basic',
  StormDegree.first: 'first',
  StormDegree.second: 'second',
};
