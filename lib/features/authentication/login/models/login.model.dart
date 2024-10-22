import 'package:freezed_annotation/freezed_annotation.dart';

import '../../user_type.enum.dart';

part 'login.model.g.dart';
part 'login.model.freezed.dart';

@freezed
class LoginDto with _$LoginDto {
  const factory LoginDto({
    required String username,
    required String password,
    required UserType userType
  }) = _LoginDto;

  factory LoginDto.fromJson(Map<String, dynamic> json) => _$LoginDtoFromJson(json);
}