import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.model.g.dart';
part 'user.model.freezed.dart';

@freezed
class UserDto with _$UserDto {
  const factory UserDto({
    required String? id,
    @JsonKey(name: "access_token") required String accessToken,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);
}