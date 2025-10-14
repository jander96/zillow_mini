import 'package:zillow_mini/src/core/data/app_error.dart';
import 'package:zillow_mini/src/core/domain/models/property.dart';
import 'package:fpdart/fpdart.dart';

typedef PropertiesEither = Either<AppError, List<Property>>;
typedef PropertyEither = Either<AppError, Property>;

abstract class PropertyRepo {
  Future<List<Property>> getProperties({int? page, int? limit, String? query});
  Future<PropertyEither> getProperty(String id);
}