import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'models/user.model.dart';

class UserStorage {
  UserStorage({required this.storage});
  static const String _userStorageKey = 'user_data';

  FlutterSecureStorage storage;

  UserDto? _user;

  Future<UserDto?> _read() async {
    final encoded = await storage.read(key: _userStorageKey);
    if (encoded == null) {
      return null;
    }
    final json = jsonDecode(encoded) as Map<String, dynamic>;
    return UserDto.fromJson(json);
  }

  Future<UserDto?> getUser() async {
    if (_user != null) {
      return _user!;
    }

    if (!kIsWeb) { // FlutterSecureStorage seems unsupported on the web. Is there an alternative?
      final user = await _read();

      if (user != null) {
        _user = user;
        return _user;
      }
    }

    return null;
  }

  Future<String?> getToken() async {
    if (_user != null) {
      return _user!.accessToken;
    }

    if (!kIsWeb) {
      final user = await _read();

      if (user != null) {
        _user = user;
        return _user!.accessToken;
      }
    }

    return null;
  }

  Future<void> set(UserDto user) async {
    _user = user;

    if (!kIsWeb) {
      await storage.write(key: _userStorageKey, value: jsonEncode(user));
    }
  }

  Future<void> clear() async {
    _user = null;

    if (!kIsWeb) {
      await storage.delete(key: _userStorageKey);
    }
  }
}