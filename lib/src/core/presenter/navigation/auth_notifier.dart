import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:zillow_mini/src/core/domain/service/secure_storage_service.dart';
import 'package:zillow_mini/src/features/login/data/repo/auth_repo_impl.dart';
import 'package:zillow_mini/src/features/login/domain/models/user.dart';
import 'package:zillow_mini/src/features/login/domain/repo/auth_repo.dart';

enum AuthStatus { checking, loggedIn, loggedOut }

@singleton
class AuthNotifier extends ChangeNotifier {
  final SecureStorageService _storage;
  final AuthRepo _authRepo;

  AuthStatus _status = AuthStatus.checking;

  AuthStatus get status => _status;
  StreamSubscription<User?>? _userSubscription;

  AuthNotifier(this._storage, this._authRepo) {
    _initialize();
    _listenUserChanges();
  }

  Future<void> _initialize() async {
    final token = await _storage.getValue(AuthRepoImpl.tokeKey);
    if (token != null && token.isNotEmpty) {
      _status = AuthStatus.loggedIn;
    } else {
      _status = AuthStatus.loggedOut;
    }

    notifyListeners();
  }

  void _listenUserChanges() {
    _authRepo.currentUser.listen((event) {
      _initialize();
    });
  }

  @override
  void dispose() {
    _userSubscription?.cancel();
    super.dispose();
  }
}
