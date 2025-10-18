import 'package:json_annotation/json_annotation.dart';
import 'package:zillow_mini/src/features/login/domain/models/user.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  final String id;
  final String email;
  final String password;
  final String? name;
  final String image;
  final RoleDto role;

  UserDto({required this.id,required this.email, required this.password,required this.name, required this.role, required this.image});
  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);
  User toDomain()=> User(id: id, email: email, name: name, role: role.toDomain(), image: image);
}

enum RoleDto {
  @JsonValue('user')
  user,
  @JsonValue('admin')
  admin;

  Role toDomain()=>
      switch(this){
        RoleDto.user => Role.user,
        RoleDto.admin => Role.admin,
      };
}
