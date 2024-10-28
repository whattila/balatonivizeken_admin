import 'package:freezed_annotation/freezed_annotation.dart';
import '../location/location.dto.dart';

part 'no_go_zone_input.dto.freezed.dart';
part 'no_go_zone_input.dto.g.dart';

@freezed
class NoGoZoneInputDto with _$NoGoZoneInputDto {
  const factory NoGoZoneInputDto({
    @JsonKey(name: "_id") required String? id,
    required List<LocationDto> zonePoints,
  }) = _NoGoZoneInputDto;

  factory NoGoZoneInputDto.fromJson(Map<String, dynamic> json) => _$NoGoZoneInputDtoFromJson(json);
}