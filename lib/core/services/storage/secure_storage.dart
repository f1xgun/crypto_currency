abstract interface class SecureStorage {
  Future<String?> get({required String key});
  Future<void> write({required String key, required String value});
  Future<void> delete({required String key});
  Future<String> getToken();
}
