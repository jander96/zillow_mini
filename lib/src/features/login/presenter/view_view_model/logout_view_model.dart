import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zillow_mini/src/core/data/app_error.dart';
import 'package:zillow_mini/src/features/login/domain/repo/auth_repo.dart';

class LogoutViewModel extends Bloc<LogoutEvent, LogoutState> {
  LogoutViewModel(this._authRepo) : super(LogoutInitial()) {
    on<LogoutButtonPressed>(_logout);
  }

  final AuthRepo _authRepo;

  void _logout(LogoutButtonPressed event, Emitter<LogoutState> emit) async {
    emit(LogoutLoading());

    final result = await _authRepo.logout();

    result.fold(
      (error) {
        emit(LoginError(error));
      },
      (_) {
        emit(LogoutSuccess());
      },
    );
  }
}

sealed class LogoutEvent {}

class LogoutButtonPressed extends LogoutEvent {}

sealed class LogoutState {}

class LogoutInitial extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutSuccess extends LogoutState {}

class LoginError extends LogoutState {
  final AppError error;

  LoginError(this.error);
}
