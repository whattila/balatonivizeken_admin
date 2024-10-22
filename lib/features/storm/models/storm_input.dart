import 'package:balatonivizeken_admin/features/storm/models/storm_degree.enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'storm_input.freezed.dart';
part 'storm_input.g.dart';

@freezed
class StormInputDto with _$StormInputDto {
  const factory StormInputDto({
    required String area,
    required double longitude,
    required double latitude,
    required String date,
    required StormDegree degree,
    required int windSpeed
  }) = _StormInputDto;

  factory StormInputDto.fromJson(Map<String, Object?> json)
  => _$StormInputDtoFromJson(json);
}