import 'package:crypto_currency/core/services/storage/secure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mocktail/mocktail.dart';

class MockSecureStorage extends Mock implements SecureStorage {}

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}
