import 'package:json_annotation/json_annotation.dart';
import 'package:zillow_mini/src/features/login/domain/models/auth_request.dart';

part 'auth_request_dto.g.dart';

@JsonSerializable()
class AuthRequestDto {
  final String email;
  final String password;

  AuthRequestDto({required this.email, required this.password});
  factory AuthRequestDto.fromJson(Map<String, dynamic> json) => _$AuthRequestDtoFromJson(json);
  factory AuthRequestDto.fromDomain(AuthRequest req)=> AuthRequestDto(email: req.email, password: req.password);
  Map<String, dynamic> toJson() => _$AuthRequestDtoToJson(this);
}

