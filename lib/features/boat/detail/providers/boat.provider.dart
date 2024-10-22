import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/dio/dio_error_handler.dart';
import '../../../../shared/repositories/balatonivizeken_client/balatonivizeken_client.provider.dart';
import '../models/boat.model.dart';

part 'boat.provider.g.dart';

@riverpod
Future<BoatDto> boatById(BoatByIdRef ref, {required String id}) async {
  final balatoniVizekenClient = ref.watch(
    balatoniVizekenClientProvider(
      onError: (e, handler) => DioErrorHandler.handleErrorMessage(e),
    ),
  );
  final boatData = await balatoniVizekenClient.getBoatById(id: id);
  return boatData;
}