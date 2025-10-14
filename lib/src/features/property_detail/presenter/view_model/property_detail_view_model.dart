import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zillow_mini/src/core/data/app_error.dart';
import 'package:zillow_mini/src/core/domain/repo/property_repo.dart';
import 'package:zillow_mini/src/core/presenter/models/property_ui.dart';

class PropertyDetailViewModel extends Bloc<PropertyDetailEvent, PropertyDetailState> {
  PropertyDetailViewModel(this._id, this._repo) : super(PropertyDetailInitial()) {
    on<PropertyDetailStarted>(_loadProperty);
    add(PropertyDetailStarted());
  }

  final PropertyRepo _repo;
  final String _id;

  Future<void> _loadProperty(PropertyDetailStarted event, Emitter<PropertyDetailState> emit) async {
    emit(PropertyDetailLoading());
    final result = await _repo.getProperty(_id);
    result.fold(
      (error) => emit(PropertyDetailError(error)),
      (prop) => emit(PropertyDetailLoaded(PropertyUI.fromDomain(prop))),
    );
  }
}

sealed class PropertyDetailEvent {}

class PropertyDetailStarted extends PropertyDetailEvent {}

sealed class PropertyDetailState {}

class PropertyDetailInitial extends PropertyDetailState {}

class PropertyDetailLoading extends PropertyDetailState {}

class PropertyDetailLoaded extends PropertyDetailState {
  final PropertyUI property;

  PropertyDetailLoaded(this.property);
}

class PropertyDetailError extends PropertyDetailState {
  final AppError error;

  PropertyDetailError(this.error);
}
