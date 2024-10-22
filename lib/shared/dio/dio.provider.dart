import 'dart:io';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repositories/user_storage/providers/user_storage.provider.dart';

part 'dio.provider.g.dart';

@riverpod
Dio dio(
  DioRef ref, {
  void Function(DioError e, ErrorInterceptorHandler handler)? onError,
}) {
  final dio = Dio();
  dio.options.contentType = Headers.jsonContentType;
  dio.interceptors.add(
    InterceptorsWrapper(
      onResponse: (e, handler) {
        print('Http status: ${e.statusCode} - data: ${e.data}');
        return handler.next(e);
      },
      onRequest: (e, handler) async {
        final accessToken = await ref.read(userStorageProvider).getToken();
        if (accessToken != null) {
          e.headers[HttpHeaders.authorizationHeader] = 'Bearer $accessToken';
        }
        return handler.next(e);
      },
      onError: (e, handler) async {
        if (onError != null) {
          onError(e, handler);
        }

        return handler.next(e);
      },
    ),
  );
  return dio;
}