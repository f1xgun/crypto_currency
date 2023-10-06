import 'package:crypto_currency/core/exceptions/app_state.dart';
import 'package:dio/dio.dart';

class NetworkHandler {
  static Future<Map<String, dynamic>> parseResult(
      Future<Response<dynamic>> req) {
    return req.then((resp) {
      switch (resp.statusCode) {
        case 200:
          final rawData = resp.data as Map<String, dynamic>;
          if (rawData.containsKey('data')) {
            if (rawData['data'] != null && rawData['data'] != '') {
              return rawData['data'] as Map<String, dynamic>;
            }
          }
          return {};
        case 204:
          return {};
        case 400:
        case 422:
          final rawData = resp.data as Map<String, dynamic>;
          // TODO: handle to throw error after implement this on server
          if (rawData.containsKey('errors')) {
            if (rawData['errors'] != null) {
              throw AppStateWrong.warning(
                  '${resp.statusCode} ${resp.statusMessage}');
            }
          }
          throw AppStateWrong.error('server error: no content');
        default:
          if (resp.data is String) {
            throw AppStateWrong.error('[${resp.statusCode}] server error',
                details: resp.data as String);
          }

          throw AppStateWrong.error('[${resp.statusCode}] server error');
      }
    });
  }
}
