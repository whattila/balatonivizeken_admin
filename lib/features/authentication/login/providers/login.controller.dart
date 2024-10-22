import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rustic/option.dart';
import 'package:rustic/result.dart';
import '../../../../shared/dio/dio_error_handler.dart';
import '../../../../shared/repositories/balatonivizeken_client/balatonivizeken_client.dart';
import '../../../../shared/repositories/balatonivizeken_client/balatonivizeken_client.provider.dart';
import '../../../../shared/repositories/user_storage/models/user.model.dart';
import '../../../../shared/repositories/user_storage/providers/user_storage.provider.dart';
import '../../../../shared/widgets/snack.dart';
import '../../user_type.enum.dart';
import '../models/login.model.dart';

part 'login.controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  Option<Result<Option<UserDto>, Object>> build() {
    state = const None();
    return state;
  }

  BalatoniVizekenClient get api => ref.read(
    balatoniVizekenClientProvider(
      onError: (e, handler) {
        Snack.showWithoutContext(text: DioErrorHandler.getErrorMessage(e));
      },
    ),
  );

  Future<void> _handleData({required UserDto data}) async {
    final tokenStorage = ref.read(userStorageProvider);
    await tokenStorage.set(data);
    state = Some(Ok(Some(data)));
  }

  Future<void> login({required String username, required String password}) async {
    state = const Some(Ok(None()));
    try {
      final data = await api.login(
        loginDto: LoginDto(
            username: username,
            password: password,
            userType: UserType.admin
        ),
      );
      await _handleData(data: data);
    } catch (e) {
      state = Some(Err(e));
    }
  }
}