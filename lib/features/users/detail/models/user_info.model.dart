import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../authentication/user_type.enum.dart';

part 'user_info.model.g.dart';
part 'user_info.model.freezed.dart';

@freezed
class UserInfoDto with _$UserInfoDto {
  const factory UserInfoDto({
    @JsonKey(name: "_id") required String? id,
    required String username,
    required String emailAddress,
    required String familyName,
    required String givenName,
    required String phoneNumber,
    @JsonKey(fromJson: UserTypeExtension.fromString) required UserType userType,
  }) = _UserInfoDto;

  factory UserInfoDto.fromJson(Map<String, dynamic> json) => _$UserInfoDtoFromJson(json);
}