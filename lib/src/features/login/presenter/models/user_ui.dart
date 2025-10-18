import 'package:zillow_mini/src/features/login/domain/models/user.dart';

class UserUI {
  final String email;
  final String? name;
  final RoleUI role;
  final String image;


  UserUI({required this.email, required this.name, required this.role, required this.image});

  factory UserUI.fromDomain(User user) =>
      UserUI(email: user.email, name: user.name, role: RoleUI.fromDomain(user.role), image: user.image);
}

enum RoleUI {
  user,
  admin;

  static RoleUI fromDomain(Role role) => switch (role) {
    Role.user => RoleUI.user,
    Role.admin => RoleUI.admin,
  };
}
