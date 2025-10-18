import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_request.freezed.dart';

@freezed
class AuthRequest with _$AuthRequest {
  @override
  final String email;
  @override
  final String password;

  AuthRequest({required this.email, required this.password});
}

