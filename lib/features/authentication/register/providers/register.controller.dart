import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rustic/option.dart';
import 'package:rustic/result.dart';
import '../../../../shared/dio/dio_error_handler.dart';
import '../../../../shared/repositories/balatonivizeken_client/balatonivizeken_client.provider.dart';
import '../../../../shared/widgets/snack.dart';
import '../models/registration.model.dart';

part 'register.controller.g.dart';

@riverpod
class RegisterController extends _$RegisterController {
  @override
  Option<Result<Option<void>, Object>> build() {
    return const None();
  }

  Future<void> register({required RegistrationDto registrationDto}) async {
    final api = ref.read(
      balatoniVizekenClientProvider(
        onError: (e, handler) {
          DioErrorHandler.handleErrorMessage(e);
          Snack.showWithoutContext(text: DioErrorHandler.getErrorMessage(e));
        },
      ),
    );
    try {
      state = const Some(Ok(None()));
      await api.register(registrationDto: registrationDto);
      state = const Some(Ok(Some(null)));
    } catch (e) {
      state = Some(Err(e));
    }
  }
}