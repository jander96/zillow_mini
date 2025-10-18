import 'package:json_annotation/json_annotation.dart';
import 'package:zillow_mini/src/features/login/domain/models/auth_response.dart';

part 'auth_response_dto.g.dart';

@JsonSerializable()
class AuthResponseDto {
  final String token;

  AuthResponseDto({required this.token});

  factory AuthResponseDto.fromJson(Map<String, dynamic> json) => _$AuthResponseDtoFromJson(json);

  AuthResponse toDomain() => AuthResponse(token: token);

  Map<String, dynamic> toJson() => _$AuthResponseDtoToJson(this);
}
