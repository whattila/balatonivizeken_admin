import 'package:freezed_annotation/freezed_annotation.dart';
import '../../user_type.enum.dart';

part 'registration.model.g.dart';
part 'registration.model.freezed.dart';

@freezed
class RegistrationDto with _$RegistrationDto {
  const factory RegistrationDto({
    required String username,
    required String emailAddress,
    required String password,
    required String familyName,
    required String givenName,
    required String phoneNumber,
    required UserType userType,
    required String? invitationCode
  }) = _RegistrationDto;

  factory RegistrationDto.fromJson(Map<String, dynamic> json) => _$RegistrationDtoFromJson(json);
}