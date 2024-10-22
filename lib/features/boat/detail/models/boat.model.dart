import 'package:freezed_annotation/freezed_annotation.dart';
import '../../boat_type.enum.dart';

part 'boat.model.freezed.dart';
part 'boat.model.g.dart';

@freezed
class BoatDto with _$BoatDto {
  const factory BoatDto({
    // ignore: invalid_annotation_target
    @JsonKey(name: "_id") required String? id,
    required String userId,
    @JsonKey(fromJson: BoatTypeExtension.fromString) required BoatType boatType,
    required String displayName,
    required double longitude,
    required double latitude,
    required bool gpsEnabled,
    String? boatColor,
  }) = _BoatDto;

  factory BoatDto.fromJson(Map<String, dynamic> json) => _$BoatDtoFromJson(json);
}