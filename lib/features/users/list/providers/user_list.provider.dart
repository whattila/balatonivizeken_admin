import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../shared/dio/dio_error_handler.dart';
import '../../../../shared/repositories/balatonivizeken_client/balatonivizeken_client.dart';
import '../../../../shared/repositories/balatonivizeken_client/balatonivizeken_client.provider.dart';
import '../../../../shared/widgets/snack.dart';
import '../models/user.header.dart';

part 'user_list.provider.g.dart';

// TODO test: létrehozás után egyenlő lesz-e a state az api.getAllUsers() visszatérési értékével? a refreshUsers futása után 1 perccel történik-e api.getAllUsers hívás?
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
        state = const AsyncLoading();
        state = await AsyncValue.guard(api.getAllUsers);
      },
    );
  }

  void cancelTimer() => timer?.cancel();
}
