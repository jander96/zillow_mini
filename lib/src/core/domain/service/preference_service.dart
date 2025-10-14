abstract class PreferenceService {
  Future<void> setValue<T>(String key, T value, {Map<String, dynamic> Function(T value)? serializer});

  Future<T?> getValue<T>(String key, {T Function(Map<String,dynamic> json)? deserializer});

  Future<void> remove(String key);

  Future<void> clear();
}