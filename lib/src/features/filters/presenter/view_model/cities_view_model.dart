import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zillow_mini/src/features/filters/domain/filters_repo.dart';

class CitiesViewModel extends Cubit<List<String>> {
  CitiesViewModel(this._repo) : super(const []) {
    _listenToCitiesUpdates();
  }

  StreamSubscription<List<String>>? _subscription;
  final FiltersRepo _repo;

  void _listenToCitiesUpdates() {
    _subscription = _repo.cities.listen((cities) {
      emit(cities);
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
