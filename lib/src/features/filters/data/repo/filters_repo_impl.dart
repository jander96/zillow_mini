import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:zillow_mini/src/features/filters/data/models/filters_dto.dart';
import 'package:zillow_mini/src/features/filters/domain/filters.dart';
import 'package:zillow_mini/src/features/filters/domain/filters_repo.dart';

@Singleton(as: FiltersRepo)
class FiltersRepoImpl extends FiltersRepo {
  FiltersRepoImpl() {
    _filtersController.add(FiltersDto());
  }

  final _filtersController = StreamController<FiltersDto>.broadcast();
  final _citiesController = StreamController<List<String>>.broadcast();
  final _mapperTransformer = StreamTransformer<FiltersDto, Filters>.fromHandlers(
    handleData: (data, sink) => sink.add(data.toDomain()),
  );
  final _cities = <String>{};

  @override
  Stream<Filters> get currentFilters => _filtersController.stream.transform(_mapperTransformer);

  @override
  Future<Filters> get filters => _filtersController.stream.first.then((value) => value.toDomain());

  @override
  void setFilters(Filters filters) {
    _filtersController.add(FiltersDto.fromDomain(filters));
  }

  @override
  Stream<List<String>> get cities => _citiesController.stream;

  @override
  void setCities(List<String> cities) {
    _cities.clear();
    _cities.addAll(cities);
    _citiesController.sink.add(_cities.toList());
  }
}
