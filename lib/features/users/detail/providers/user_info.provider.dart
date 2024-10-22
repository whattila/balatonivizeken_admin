import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../shared/dio/dio_error_handler.dart';
import '../../../../shared/repositories/balatonivizeken_client/balatonivizeken_client.provider.dart';
import '../models/user_info.model.dart';

part 'user_info.provider.g.dart';

@riverpod
Future<UserInfoDto> userById(UserByIdRef ref, {required String id}) async {
  final balatoniVizekenClient = ref.watch(
    balatoniVizekenClientProvider(
      onError: (e, handler) => DioErrorHandler.handleErrorMessage(e),
    ),
  );
  final userData = await balatoniVizekenClient.getUser(id: id);
  return userData;
}
