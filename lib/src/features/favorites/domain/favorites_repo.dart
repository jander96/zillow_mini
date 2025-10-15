import 'package:fpdart/fpdart.dart';
import 'package:zillow_mini/src/core/data/app_error.dart';

typedef BoolEither = Either<AppError, bool>;

abstract class FavoritesRepo {
  Stream<String?> get lastChange;
  Future<BoolEither> toggleFavorite(String id);
  Future<BoolEither> isFavorite(String id);
}