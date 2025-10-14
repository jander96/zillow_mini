import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:zillow_mini/src/core/data/network/model/property_dto.dart';
part 'client.g.dart';

final class ClientConstants {
  static const prefix = 'api/';
  static const version = 'v1/';
}

@RestApi()
abstract class Client {
  factory Client(Dio dio, {String? baseUrl}) = _Client;

  @GET('/properties')
  Future<List<PropertyDto>> getProperties(@Query('page') int? page, @Query('limit') int? limit, @Query('title') String? title);

  @GET('/properties/{id}')
  Future<PropertyDto> getProperty(@Path('id') String id);

}