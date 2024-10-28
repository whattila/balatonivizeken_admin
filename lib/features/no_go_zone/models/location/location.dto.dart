import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.dto.g.dart';
part 'location.dto.freezed.dart';

@freezed
class LocationDto with _$LocationDto {
  const factory LocationDto({
    required double longitude,
    required double latitude,
  }) = _LocationDto;

  factory LocationDto.fromJson(Map<String, dynamic> json) => _$LocationDtoFromJson(json);
}