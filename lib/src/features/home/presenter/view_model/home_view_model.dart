import 'dart:async';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:zillow_mini/src/core/domain/models/property.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zillow_mini/src/core/domain/repo/property_repo.dart';
import 'package:zillow_mini/src/core/presenter/models/property_ui.dart';
import 'package:zillow_mini/src/features/filters/domain/filters.dart';
import 'package:zillow_mini/src/features/filters/domain/filters_repo.dart';

class HomeViewModel extends Cubit<PagingState<int, PropertyUI>> {
  HomeViewModel(this._propertyRepo, this._filtersRepo) : super(PagingState()) {
    pagingController.addListener(_updateState);
    pagingController.addListener(_addCitiesToFilters);
    _listenFiltersChanges();
  }
  StreamSubscription<Filters>? _filtersSubscription;

  final PropertyRepo _propertyRepo;
  final FiltersRepo _filtersRepo;
  String? _query;
  PropertySortBy? _sortBy;
  String? _city;

  void _listenFiltersChanges() {
    _filtersSubscription = _filtersRepo.currentFilters.listen((filters) {
      _query = filters.query;
      _sortBy = filters.sortBy;
      _city = filters.city;
      pagingController.refresh();
    });
  }


  late final pagingController = PagingController<int, PropertyUI>(
    getNextPageKey: (state) => state.lastPageIsEmpty ? null : state.nextIntPageKey,
    fetchPage: (pageKey) async => (await _propertyRepo.getProperties(
      page: pageKey,
      limit: 10,
      query: _query,
      sortBy: _sortBy,
      city: _city,
    )).map((_toUI)).toList(),
  );

  PropertyUI _toUI(Property property) => PropertyUI.fromDomain(property);

  void _updateState() {
    emit(pagingController.value);
  }

  void _addCitiesToFilters(){
    _filtersRepo.setCities(pagingController.items?.map((e) => e.city,).toList() ?? []);
  }


  @override
  Future<void> close() {
    pagingController.removeListener(_updateState);
    pagingController.removeListener(_addCitiesToFilters);
    pagingController.dispose();
    _filtersSubscription?.cancel();
    return super.close();
  }
}
