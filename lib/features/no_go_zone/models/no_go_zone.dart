import 'package:freezed_annotation/freezed_annotation.dart';
import 'location/location.dto.dart';

part 'no_go_zone.freezed.dart';
part 'no_go_zone.g.dart';

@freezed
class NoGoZone with _$NoGoZone {
  const factory NoGoZone({
    @JsonKey(name: "_id") required String? id,
    required List<LocationDto> zonePoints,
  }) = _NoGoZone;

  factory NoGoZone.fromJson(Map<String, dynamic> json) => _$NoGoZoneFromJson(json);
}