import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:zillow_mini/src/core/domain/service/secure_storage_service.dart';

@Injectable(as: SecureStorageService)
class SecureStorageServiceImpl extends SecureStorageService {
  SecureStorageServiceImpl(this._storage);

  final FlutterSecureStorage _storage;

  @override
  Future<void> clear() async {
    return _storage.deleteAll();
  }

  @override
  Future<void> remove(String key) {
    return _storage.delete(key: key);
  }

  @override
  Future<String?> getValue(String key) {
    return _storage.read(key: key);
  }

  @override
  Future<void> save(String key, String value) {
    return _storage.write(key: key, value: value);
  }
}
