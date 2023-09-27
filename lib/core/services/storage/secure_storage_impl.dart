import 'package:crypto_currency/core/services/storage/secure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageImpl implements SecureStorage {
  final FlutterSecureStorage _flutterSecureStorage;
  SecureStorageImpl({required FlutterSecureStorage flutterSecureStorage})
      : _flutterSecureStorage = flutterSecureStorage;

  @override
  Future<void> delete({required String key}) async {
    await _flutterSecureStorage.delete(key: key);
  }

  @override
  Future<String?> get({required String key}) async {
    final String? value = await _flutterSecureStorage.read(key: key);
    return value;
  }

  @override
  Future<String> getToken() async {
    final String token = await _flutterSecureStorage.read(key: 'token') ?? '';
    return token;
  }

  @override
  Future<void> write({required String key, required String value}) async {
    await _flutterSecureStorage.write(key: key, value: value);
  }
}
