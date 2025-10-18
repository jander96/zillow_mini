abstract class SecureStorageService {
  Future<void> save(String key, String value);

  Future<String?> getValue(String key);

  Future<void> remove(String key);

  Future<void> clean();
}
