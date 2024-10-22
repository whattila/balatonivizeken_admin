import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../authentication/user_type.enum.dart';

part 'user.header.freezed.dart';
part 'user.header.g.dart';

@freezed
class UserHeaderDto with _$UserHeaderDto {
  const factory UserHeaderDto({
    @JsonKey(name: "_id") required String? id,
    required String username,
    required String phoneNumber,
    @JsonKey(fromJson: UserTypeExtension.fromString) required UserType userType,
  }) = _UserHeaderDto;

  factory UserHeaderDto.fromJson(Map<String, Object?> json) => _$UserHeaderDtoFromJson(json);
}
