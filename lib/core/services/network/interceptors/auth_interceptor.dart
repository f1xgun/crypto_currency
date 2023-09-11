import 'package:crypto_currency/core/services/storage/secure_storage.dart';
import 'package:dio/dio.dart';

class AuthInterceptor implements Interceptor {
  final SecureStorage _secureStorage;

  const AuthInterceptor({required SecureStorage secureStorage})
      : _secureStorage = secureStorage;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
  }

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Authorization'] = await _secureStorage.getToken();
    handler.next(options);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
  }
}
