import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import 'package:rxdart/rxdart.dart';
import 'package:zillow_mini/src/core/data/app_error.dart';
import 'package:zillow_mini/src/core/domain/service/secure_storage_service.dart';
import 'package:zillow_mini/src/features/login/data/models/user_dto.dart';
import 'package:zillow_mini/src/features/login/data/service/security_service.dart';
import 'package:zillow_mini/src/features/login/domain/models/auth_request.dart';
import 'package:zillow_mini/src/features/login/domain/models/auth_response.dart';
import 'package:zillow_mini/src/features/login/domain/models/user.dart';
import 'package:zillow_mini/src/features/login/domain/repo/auth_repo.dart';

@Singleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl(this._securityService, this._secureStorage){
    me();
  }

  static const tokeKey = 'jwt_key';

  final SecurityService _securityService;
  final SecureStorageService _secureStorage;
  final _userController = BehaviorSubject<UserDto?>.seeded(null);
  final _mapperTransformer = StreamTransformer<UserDto?, User?>.fromHandlers(
    handleData: (data, sink) => sink.add(data?.toDomain()),
  );

  @override
  Stream<User?> get currentUser => _userController.stream.transform(_mapperTransformer);

  @override
  Future<AuthEither> login(AuthRequest credentials) async {
    try {
      final users = await _loadMockUsers();
      final user = users.firstWhere((user) => user.email == credentials.email && user.password == credentials.password);
      final token = _securityService.generateJwt(int.parse(user.id));
      await _secureStorage.save(tokeKey, token);
      return Right(AuthResponse(token: token));
    } catch (e) {
      return Left(NotFoundError());
    }
  }

  @override
  Future<VoidEither> logout() async {
    try {
      await _secureStorage.remove(tokeKey);
      _userController.add(null);
      return Right(null);
    } catch (e) {
      return Left(UnknownError(message: e.toString()));
    }
  }

  @override
  Future<UserEither> me() async {
    try {
      final token = await _secureStorage.getValue(tokeKey);
      if (token == null) {
        return Left(UnauthorizedError());
      }
      final id = _securityService.verifyToken(token).payload['id'];
      final users = await _loadMockUsers();
      final user = users.firstWhere((user) => user.id == id.toString());
      _userController.add(user);
      return Right(user.toDomain());
    } catch (e) {
      return Left(UnauthorizedError());
    }
  }

  Future<List<UserDto>> _loadMockUsers() async {
    await Future.delayed(Duration(milliseconds: 700));
    final jsonString = await rootBundle.loadString('assets/raw/user_table.json');
    return (jsonDecode(jsonString) as List<dynamic>).map((json) => UserDto.fromJson(json as Map<String,dynamic>)).toList();
  }
}
