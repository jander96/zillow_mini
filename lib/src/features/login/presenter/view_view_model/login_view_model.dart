import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zillow_mini/src/core/data/app_error.dart';
import 'package:zillow_mini/src/features/login/domain/models/auth_request.dart';
import 'package:zillow_mini/src/features/login/domain/repo/auth_repo.dart';
import 'package:zillow_mini/src/features/login/presenter/models/user_ui.dart';

class LoginViewModel extends Bloc<LoginEvent, LoginState> {
  LoginViewModel(this._authRepo) : super(LoginInitial()) {
    on<LoginButtonPressed>(_login);
    on<LoginTokenReceived>(_getSession);
  }

  final AuthRepo _authRepo;

  void _login(LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    final result = await _authRepo.login(AuthRequest(email: event.email, password: event.password));

    result.fold(
      (error) {
        emit(LoginError(error));
      },
      (_) {
        add(LoginTokenReceived());
      },
    );
  }

  void _getSession(LoginTokenReceived event, Emitter<LoginState> emit) async {
    final result = await _authRepo.me();
    result.fold(
      (error) {
        emit(LoginError(error));
      },
      (user) {
        emit(LoginSuccess(UserUI.fromDomain(user)));
      },
    );
  }
}



sealed class LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;

  LoginButtonPressed(this.email, this.password);
}

class LoginTokenReceived extends LoginEvent {}

sealed class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final UserUI user;

  LoginSuccess(this.user);
}

class LoginError extends LoginState {
  final AppError error;

  LoginError(this.error);
}
