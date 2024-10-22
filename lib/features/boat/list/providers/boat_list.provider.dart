import 'dart:async';
import 'package:balatonivizeken_admin/features/boat/list/models/boat.header.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/dio/dio_error_handler.dart';
import '../../../../shared/repositories/balatonivizeken_client/balatonivizeken_client.dart';
import '../../../../shared/repositories/balatonivizeken_client/balatonivizeken_client.provider.dart';
import '../../../../shared/widgets/snack.dart';

part 'boat_list.provider.g.dart';

@riverpod
class BoatList extends _$BoatList {
  @override
  Future<List<BoatHeaderDto>> build() async => await api.getBoatHeaders();

  Timer? timer;

  BalatoniVizekenClient get api => ref.read(
    balatoniVizekenClientProvider(
      onError: (e, handler) {
        Snack.showWithoutContext(text: DioErrorHandler.getErrorMessage(e));
      },
    ),
  );

  Future<void> refreshBoats() async {
    timer?.cancel();
    timer = Timer.periodic(
      const Duration(minutes: 1),
      (timer) async {
        print('BOAT UPDATE STARTED');
        final boatHeaders = await api.getBoatHeaders();

        state = state.when(
          data: (data) {
            return AsyncValue.data(boatHeaders);
          },
          error: AsyncValue.error,
          loading: AsyncValue.loading,
        );
      },
    );
  }

  void cancelTimer() => timer?.cancel();
}