import 'package:balatonivizeken_admin/features/no_go_zone/models/input/no_go_zone_input.dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/dio/dio_error_handler.dart';
import '../../../shared/repositories/balatonivizeken_client/balatonivizeken_client.dart';
import '../../../shared/repositories/balatonivizeken_client/balatonivizeken_client.provider.dart';
import '../../../shared/widgets/snack.dart';
import '../models/location/location.dto.dart';
import '../models/no_go_zone.dart';

part 'no_go_zone.controller.g.dart';

// TODO test: a createOrUpdateNoGoZone és a deleteNoGoZone futása után a state tartalmazza illetve nem tartalmazza-e az új elemet?
@riverpod
class NoGoZoneController extends _$NoGoZoneController {
  @override
  Future<List<NoGoZone>> build() async => await api.getNoGoZones();

  BalatoniVizekenClient get api => ref.read(
    balatoniVizekenClientProvider(
      onError: (e, handler) {
        Snack.showWithoutContext(text: DioErrorHandler.getErrorMessage(e));
      },
    ),
  );

  Future<void> createOrUpdateNoGoZone({
    String? id,
    required List<LocationDto> zonePoints
  }) async {
    final noGoZone = NoGoZoneInputDto(id: id, zonePoints: zonePoints);
    await api.createOrUpdateNoGoZone(noGoZoneInputDto: noGoZone);
    _refreshZones();
    if (!state.hasError) {
      Snack.showWithoutContext(text: 'Zónák sikeresen módosítva');
    }
  }

  Future<void> deleteNoGoZone({
    required String id
  }) async {
    await api.deleteNoGoZone(id: id);
    _refreshZones();
    if (!state.hasError) {
      Snack.showWithoutContext(text: 'Zóna sikeresen törölve');
    }
  }

  Future<void> _refreshZones() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(api.getNoGoZones);
  }
}