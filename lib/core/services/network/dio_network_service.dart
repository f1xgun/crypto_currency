import 'package:crypto_currency/core/services/network/handler/network_handler.dart';
import 'package:crypto_currency/core/services/network/interceptors/auth_interceptor.dart';
import 'package:crypto_currency/core/services/network/network_service.dart';
import 'package:crypto_currency/core/services/storage/secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// TODO: add tests
class DioNetworkService implements NetworkService {
  late final Dio dio;
  final SecureStorage _secureStorage;

  DioNetworkService({required SecureStorage secureStorage, Dio? dioOverride})
      : _secureStorage = secureStorage {
    dio = dioOverride ?? Dio(baseOptions)
      ..interceptors.add(PrettyDioLogger())
      ..interceptors.add(AuthInterceptor(secureStorage: _secureStorage));
  }

  BaseOptions get baseOptions =>
      BaseOptions(baseUrl: baseUrl, headers: headers);

  // TODO: add baseUrl
  @override
  String get baseUrl => '';

  @override
  Map<String, String> get headers => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

  @override
  Future<Map<String, dynamic>> delete(String endpoint) {
    return NetworkHandler.parseResult(dio.delete(endpoint));
  }

  @override
  Future<Map<String, dynamic>> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) {
    return NetworkHandler.parseResult(
        dio.get(endpoint, queryParameters: queryParameters));
  }

  @override
  Future<Map<String, dynamic>> post(String endpoint,
      {Map<String, dynamic>? queryParameters}) {
    return NetworkHandler.parseResult(
        dio.post(endpoint, queryParameters: queryParameters));
  }

  @override
  Future<Map<String, dynamic>> put(String endpoint,
      {Map<String, dynamic>? queryParameters}) {
    return NetworkHandler.parseResult(
        dio.put(endpoint, queryParameters: queryParameters));
  }
}
