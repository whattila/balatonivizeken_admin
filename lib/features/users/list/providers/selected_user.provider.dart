import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/user.header.dart';

part 'selected_user.provider.g.dart';

@riverpod
class SelectedUser extends _$SelectedUser {
  @override
  UserHeaderDto? build() => null;

  void setSelectedUser(UserHeaderDto user) {
    state = user;
  }
}