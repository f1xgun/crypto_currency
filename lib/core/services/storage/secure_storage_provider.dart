import 'package:crypto_currency/core/services/storage/secure_storage.dart';
import 'package:crypto_currency/core/services/storage/secure_storage_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final secureStorageProvider = Provider<SecureStorage>((_) =>
    SecureStorageImpl(flutterSecureStorage: const FlutterSecureStorage()));
