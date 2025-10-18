import 'package:fpdart/fpdart.dart';
import 'package:zillow_mini/src/core/data/app_error.dart';
import 'package:zillow_mini/src/features/login/domain/models/auth_request.dart';
import 'package:zillow_mini/src/features/login/domain/models/auth_response.dart';
import 'package:zillow_mini/src/features/login/domain/models/user.dart';

typedef AuthEither = Either<AppError, AuthResponse>;
typedef UserEither = Either<AppError, User>;
typedef VoidEither = Either<AppError, void>;


abstract class AuthRepo {

  Stream<User?> get currentUser;

  Future<UserEither> me();

  Future<AuthEither> login(AuthRequest credentials);

  Future<VoidEither> logout();

}
