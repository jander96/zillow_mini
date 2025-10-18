import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zillow_mini/src/core/domain/service/secure_storage_service.dart';
import 'package:zillow_mini/src/features/login/data/repo/auth_repo_impl.dart';

@singleton
class JWTInterceptor extends Interceptor {
  JWTInterceptor(this._secureStorage);

  final SecureStorageService _secureStorage;
  static String? _accessToken;

  String? get accessToken => _accessToken;

  void cleanTokenCache() {
    _accessToken = null;
  }

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    var token = _accessToken;
    if (token == null || _tokenHasExpired(token)) {
      token = await _loadAccessToken();
    }

    if (token == null) {
      options.headers.remove(HttpHeaders.authorizationHeader);
      return handler.next(options);
    }
    options.headers.addAll({HttpHeaders.authorizationHeader: 'Bearer $token'});
    return handler.next(options);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  bool _tokenHasExpired(String? token) => false;

  Future<String?> _loadAccessToken() async {
    final token = await _secureStorage.getValue(AuthRepoImpl.tokeKey);
    _accessToken = token;
    return token;
  }
}
