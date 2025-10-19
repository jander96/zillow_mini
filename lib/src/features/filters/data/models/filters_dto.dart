import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zillow_mini/src/core/domain/models/property.dart';
import 'package:zillow_mini/src/features/filters/domain/filters.dart';

part 'filters_dto.g.dart';

part 'filters_dto.freezed.dart';

@freezed
@JsonSerializable()
class FiltersDto with _$FiltersDto {
  @override
  final PropertySortBy? sortBy;
  @override
  final String? query;
  @override
  final String? city;

  FiltersDto({this.sortBy, this.query, this.city});

  factory FiltersDto.fromJson(Map<String, dynamic> json) => _$FiltersDtoFromJson(json);

  factory FiltersDto.fromDomain(Filters filters) =>
      FiltersDto(sortBy: filters.sortBy, query: filters.query, city: filters.city);

  Map<String, dynamic> toJson() => _$FiltersDtoToJson(this);

  Filters toDomain() => Filters(sortBy: sortBy, query: query, city: city);
}
