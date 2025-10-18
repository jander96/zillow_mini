
import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_response.freezed.dart';

@freezed
class AuthResponse with _$AuthResponse {
  final String token;
  AuthResponse({required this.token});
}

