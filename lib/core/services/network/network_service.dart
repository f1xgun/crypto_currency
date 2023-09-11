abstract class NetworkService {
  String get baseUrl;

  Map<String, String> get headers;

  Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, dynamic>? queryParametres,
  });

  Future<Map<String, dynamic>> post(
    String endpoint, {
    Map<String, dynamic>? queryParametres,
  });

  Future<Map<String, dynamic>> delete(String endpoint);

  Future<Map<String, dynamic>> put(String endpoint,
      {Map<String, dynamic>? queryParametres});
}
