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

  @override
  final double? minPrice;
  @override
  final double? maxPrice;

  Filters({ this.sortBy,  this.query,  this.city,this.minPrice , this.maxPrice});

  int get count {
    final active = [
      if (sortBy != null) 1,

    ];
    return active.fold(0, (previousValue, element) => previousValue + element);
  }
}