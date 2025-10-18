import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@injectable
class SecurityService {
  final secretKey = SecretKey(dotenv.env['JWT_SECRET_KEY']!);

  String generateJwt(int userId) {
    final jwt = JWT({'id': userId}, issuer: 'zillow_mini');

    return jwt.sign(secretKey);
  }

  JWT verifyToken(String token) {
    return JWT.verify(token, secretKey);
  }
}
