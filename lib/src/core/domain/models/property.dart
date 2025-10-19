
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zillow_mini/src/core/domain/models/property_type.dart';
part 'property.freezed.dart';

@freezed
class Property with _$Property {
  @override
  final String title;
  @override
  final String city;
  @override
  final String price;
  @override
  final String image;
  @override
  final String description;
  @override
  final DateTime createdAt;
  @override
  final double lat;
  @override
  final double long;
  @override
  final String id;
  @override
  final PropertyType type;

  Property({
    required this.title,
    required this.city,
    required this.price,
    required this.image,
    required this.description,
    required this.createdAt,
    required this.lat,
    required this.long,
    required this.id,
    required this.type,
  });
}

enum PropertySortBy {
  priceAsc,
  priceDesc,
  cityAsc,
  cityDesc
}


