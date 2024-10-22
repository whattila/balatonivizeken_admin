import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../dio/dio.provider.dart';
import 'balatonivizeken_client.dart';

part 'balatonivizeken_client.provider.g.dart';

@riverpod
BalatoniVizekenClient balatoniVizekenClient(
  BalatoniVizekenClientRef ref, {
  void Function(DioError, ErrorInterceptorHandler)? onError,
}) {
  final dio = ref.watch(dioProvider(onError: onError));
  return BalatoniVizekenClient(dio);
}