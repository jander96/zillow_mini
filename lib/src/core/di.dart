import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zillow_mini/environments.dart';

import 'data/network/api/client.dart';

@module
abstract class ApiClientModule {
  @lazySingleton
  Dio dio() => _createDio();

  @lazySingleton
  Client provideApiClient(Dio dio) => Client(dio);
}

Dio _createDio() {
  final dio = Dio(
      BaseOptions(
          baseUrl: Environments.host + ClientConstants.prefix + ClientConstants.version,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
          }
      )
  );

  dio.options.connectTimeout = const Duration(seconds: 8);
  dio.options.receiveTimeout = const Duration(seconds: 8);

  dio.interceptors.addAll([
    LogInterceptor(requestBody: true, responseBody: true),
  ]);

  return dio;
}