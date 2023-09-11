import 'dart:io';

import 'package:crypto_currency/core/exceptions/exceptions.dart';
import 'package:crypto_currency/core/services/network/interceptors/auth_interceptor.dart';
import 'package:crypto_currency/core/services/network/network_service.dart';
import 'package:crypto_currency/core/services/storage/secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

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

  @override
  String get baseUrl => throw UnimplementedError();

  @override
  Map<String, String> get headers => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

  @override
  Future<Map<String, dynamic>> delete(String endpoint) async {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> get(String endpoint,
      {Map<String, dynamic>? queryParametres}) async {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> post(String endpoint,
      {Map<String, dynamic>? queryParametres}) async {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> put(String endpoint,
      {Map<String, dynamic>? queryParametres}) async {
    // TODO: implement put
    throw UnimplementedError();
  }

  Future<T> _request<T>(Future<T> Function() requestFunc) async {
    try {
      return await requestFunc();
    } on DioException catch (dioException) {
      switch (dioException.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.cancel:
        case DioExceptionType.connectionError:
          throw NoInternetException();
        case DioExceptionType.badResponse:
          throw ResponseException(message: dioException.error.toString());
        default:
          if (dioException.error is SocketException) {
            throw NoInternetException();
          } else {
            throw UnknownNetworkException(
                message: dioException.error.toString());
          }
      }
    } on SocketException catch (_) {
      throw NoInternetException();
    } on Object catch (err) {
      throw UnknownNetworkException(message: err.toString());
    }
  }
}
