import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../user_storage.dart';

part 'user_storage.provider.g.dart';

@Riverpod(keepAlive: true)
UserStorage userStorage(UserStorageRef ref) {
  return UserStorage(storage: const FlutterSecureStorage());
}