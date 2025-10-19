import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zillow_mini/src/core/data/app_error.dart';
import 'package:zillow_mini/src/core/domain/service/cache_manager.dart';

class CacheCleanerViewModel extends Cubit<CleanerState> {
  CacheCleanerViewModel(this._cacheManager) : super(CleanerInitial());
  final CacheManager _cacheManager;

  Future<void> clean() async {
    emit(CleanerLoading());
    final result = await _cacheManager.clean();
    result.fold(
      (error) {
        emit(CleanerError(error));
      },
      (_) {
        emit(CleanerSuccess());
      },
    );
  }
}

sealed class CleanerState {}

class CleanerInitial extends CleanerState {}

class CleanerLoading extends CleanerState {}

class CleanerSuccess extends CleanerState {}

class CleanerError extends CleanerState {
  final AppError? error;

  CleanerError(this.error);
}
