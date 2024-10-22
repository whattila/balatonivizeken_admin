import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../shared/dio/dio_error_handler.dart';
import '../../../../shared/repositories/balatonivizeken_client/balatonivizeken_client.dart';
import '../../../../shared/repositories/balatonivizeken_client/balatonivizeken_client.provider.dart';
import '../../../../shared/widgets/snack.dart';
import '../models/user.header.dart';

part 'user_list.provider.g.dart';

@riverpod
class UserList extends _$UserList {
  @override
  Future<List<UserHeaderDto>> build() async => await api.getAllUsers();

  Timer? timer;

  BalatoniVizekenClient get api => ref.read(
    balatoniVizekenClientProvider(
      onError: (e, handler) {
        Snack.showWithoutContext(text: DioErrorHandler.getErrorMessage(e));
      },
    ),
  );

  Future<void> refreshUsers() async {
    timer?.cancel();
    timer = Timer.periodic(
      const Duration(minutes: 1),
      (timer) async {
        print('USER UPDATE STARTED');
        final userHeaders = await api.getAllUsers();

        state = state.when(
          data: (data) {
            return AsyncValue.data(userHeaders);
          },
          error: AsyncValue.error,
          loading: AsyncValue.loading,
        );
      },
    );
  }

  void cancelTimer() => timer?.cancel();
}
