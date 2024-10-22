import 'package:balatonivizeken_admin/features/storm/models/storm_input.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../shared/dio/dio_error_handler.dart';
import '../../../shared/repositories/balatonivizeken_client/balatonivizeken_client.provider.dart';
import '../../../shared/widgets/snack.dart';

part 'create_storm_alert.controller.g.dart';

@riverpod
class CreateStormAlertController extends _$CreateStormAlertController {
  @override
  FutureOr<void> build() {
    // no-op
  }

  Future<void> createStorm(StormInputDto storm) async {
    final api = ref.read(
      balatoniVizekenClientProvider(
        onError: (e, handler) {
          DioErrorHandler.handleErrorMessage(e);
          Snack.showWithoutContext(text: DioErrorHandler.getErrorMessage(e));
        },
      ),
    );
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => api.createStorm(stormInputDto: storm));
  }
}