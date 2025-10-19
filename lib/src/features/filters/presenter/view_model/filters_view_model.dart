import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zillow_mini/src/features/filters/domain/filters.dart';
import 'package:zillow_mini/src/features/filters/domain/filters_repo.dart';

class FiltersViewModel extends Cubit<Filters> {
  FiltersViewModel(this._repo) : super(Filters());
  final FiltersRepo _repo;

  void setFilters(Filters Function(Filters filters) update) {
    final newFilters = update(state);
    emit(newFilters);
    _repo.setFilters(newFilters);
  }
}
