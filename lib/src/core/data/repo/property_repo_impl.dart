import 'package:injectable/injectable.dart';
import 'package:zillow_mini/src/core/data/error_handler.dart';
import 'package:zillow_mini/src/core/data/network/api/client.dart';
import 'package:zillow_mini/src/core/domain/models/property.dart';
import 'package:zillow_mini/src/core/domain/repo/property_repo.dart';

@Injectable(as: PropertyRepo)
class PropertyRepoImp extends PropertyRepo with ErrorHandler {
  final Client client;

  PropertyRepoImp({required this.client});
  @override
  Future<List<Property>> getProperties({int? page, int? limit, String? title}) async {
      final response = await client.getProperties(page, limit, title);
      return response.map((e) => e.toDomain()).toList();
  }

  @override
  Future<PropertyEither> getProperty(String id) {
    return runCatching(() async {
      final response = await client.getProperty(id);
      return response.toDomain();
    },);
  }

}