import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zillow_mini/src/core/data/app_error.dart';
import 'package:zillow_mini/src/features/favorites/domain/favorites_repo.dart';

class FavoritesViewModel extends Bloc<FavoriteEvent, FavoriteState> {
  FavoritesViewModel(this._id, this._repo) : super(FavoriteInitial()) {
    on<FavoriteStarted>(_getValue);
    on<FavoriteToggle>(_toggle);
    add(FavoriteStarted());
  }

  final FavoritesRepo _repo;
  final String _id;

  Future<void> _getValue(FavoriteStarted event, Emitter<FavoriteState> emit) async {
    emit(FavoriteLoading());
    final value = await _repo.isFavorite(_id);
    value.fold(
      (error) {
        emit(FavoriteError(error: error));
      },
      (isFavorite) {
        emit(FavoriteLoaded(isFavorite: isFavorite));
      },
    );
  }

  Future<void> _toggle(FavoriteToggle event, Emitter<FavoriteState> emit) async {
    emit(FavoriteLoading());
    final value = await _repo.toggleFavorite(_id);
    value.fold(
      (error) {
        emit(FavoriteError(error: error));
      },
      (isFavorite) {
        emit(FavoriteLoaded(isFavorite: isFavorite));
      },
    );
  }
}

sealed class FavoriteEvent {}

class FavoriteStarted extends FavoriteEvent {}

class FavoriteToggle extends FavoriteEvent {}

sealed class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final bool isFavorite;

  FavoriteLoaded({required this.isFavorite});
}

class FavoriteError extends FavoriteState {
  final AppError error;

  FavoriteError({required this.error});
}
