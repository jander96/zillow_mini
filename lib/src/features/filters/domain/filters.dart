import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zillow_mini/src/core/domain/models/property.dart';
part 'filters.freezed.dart';

@freezed
class Filters  with _$Filters{
  @override
  final PropertySortBy? sortBy;
  @override
  final String? query;
  @override
  final String? city;

  Filters({ this.sortBy,  this.query,  this.city});

  int get count {
    final active = [
      if (sortBy != null) 1,

    ];
    return active.fold(0, (previousValue, element) => previousValue + element);
  }
}