import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zillow_mini/src/features/login/domain/models/user.dart';
import 'package:zillow_mini/src/features/login/domain/repo/auth_repo.dart';
import 'package:zillow_mini/src/features/login/presenter/models/user_ui.dart';

class ProfileViewModel extends Cubit<UserUI?> {
  ProfileViewModel(this._authRepo) : super(null) {
    _listenUserChanges();
  }

  StreamSubscription<User?>? _userSubscription;
  final AuthRepo _authRepo;

  void _listenUserChanges() {
    _userSubscription?.cancel();
    _userSubscription = _authRepo.currentUser.listen((user) {
      emit(user == null ? null : UserUI.fromDomain(user));
    });
  }
}
