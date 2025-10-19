import 'dart:async';
import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart' show DefaultCacheManager;
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:zillow_mini/src/core/data/app_error.dart';
import 'package:zillow_mini/src/core/domain/service/cache_manager.dart';
import 'package:zillow_mini/src/core/domain/service/preference_service.dart';
import 'package:zillow_mini/src/core/domain/service/secure_storage_service.dart';
import 'package:zillow_mini/src/features/login/domain/repo/auth_repo.dart';

@Injectable(as: CacheManager)
class CacheManagerImpl extends CacheManager {
  CacheManagerImpl(this._prefs, this._storageService);

  final _streamController = StreamController<DateTime?>.broadcast();

  final PreferenceService _prefs;
  final SecureStorageService _storageService;

  @override
  Future<VoidEither> backup() {
    // TODO: implement backup
    throw UnimplementedError();
  }

  @override
  Future<VoidEither> clean() async {
    try {
      await _prefs.clear();
      await _storageService.clear();
      await DefaultCacheManager().emptyCache();
      final Directory tempDir = await getTemporaryDirectory();
      final Directory libCacheDir = new Directory("${tempDir.path}/libCachedImageData");
      await libCacheDir.delete(recursive: true);
      _streamController.sink.add(DateTime.now());
      return Right(null);
    } catch (e) {
      return Left(UnknownError(message: e.toString()));
    }
  }

  @override
  Stream<DateTime?> get lastClean => _streamController.stream;
}
