import 'package:zillow_mini/src/features/login/domain/repo/auth_repo.dart';

abstract class CacheManager {
  Stream<DateTime?> get lastClean;
  Future<VoidEither> clean();
  Future<VoidEither> backup();
}