import 'package:freezed_annotation/freezed_annotation.dart';

import '../../boat_type.enum.dart';

part 'boat.header.freezed.dart';
part 'boat.header.g.dart';

@freezed
class BoatHeaderDto with _$BoatHeaderDto {
  const factory BoatHeaderDto({
    @JsonKey(name: "_id") required String? id,
    @JsonKey(fromJson: BoatTypeExtension.fromString) required BoatType boatType,
    required String displayName
  }) = _BoatHeaderDto;

  factory BoatHeaderDto.fromJson(Map<String, Object?> json)
  => _$BoatHeaderDtoFromJson(json);
}