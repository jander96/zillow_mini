import 'filters.dart';

abstract class FiltersRepo {
  Stream<Filters> get currentFilters;

  Future<Filters> get filters;

  Stream<List<String>> get cities;

  void setCities(List<String> cities);

  void setFilters(Filters filters);
}
