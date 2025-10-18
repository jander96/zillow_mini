
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';

@freezed
class User with _$User {
  final String id;
  final String email;
  final String? name;
  final Role role;
  final String image;

  User({required this.id, required this.email, required this.name, required this.role, required this.image});
}

enum Role {
  user,
  admin,
}