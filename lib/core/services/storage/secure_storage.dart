abstract interface class SecureStorage {
  Future<String?> get(String key);
  Future<void> write(String key, String value);
  Future<void> delete(String key);
  Future<String> getToken();
}
