import 'package:injectable/injectable.dart';
import 'package:zillow_mini/src/core/data/error_handler.dart';
import 'package:zillow_mini/src/core/domain/service/preference_service.dart';
import 'package:zillow_mini/src/features/favorites/domain/favorites_repo.dart';

@Injectable(as: FavoritesRepo)
class FavoritesRepoImpl with ErrorHandler implements FavoritesRepo {
  final PreferenceService _prefs;

  FavoritesRepoImpl(this._prefs);

  @override
  Future<BoolEither> isFavorite(String id) async {
    return runCatching(() async {
      final value = await _prefs.getValue<bool>(_getFavoritesKey(id));
      return value ?? false;
    });
  }

  @override
  Future<BoolEither> toggleFavorite(String id) async {
    return runCatching(() async {
      final value = await _prefs.getValue<bool>(_getFavoritesKey(id));
      if (value == true) {
        await _prefs.remove(_getFavoritesKey(id));
        return false;
      } else {
        await _prefs.setValue<bool>(_getFavoritesKey(id), true);
        return true;
      }
    });
  }

  String _getFavoritesKey(String id) => 'favorite_$id';
}
