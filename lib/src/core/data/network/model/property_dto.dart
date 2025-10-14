import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zillow_mini/src/core/domain/models/property.dart';
import 'package:zillow_mini/src/core/domain/models/property_type.dart';

part 'property_dto.g.dart';

@JsonSerializable()
class PropertyDto {
  final String title;
  final String city;
  final String price;
  final String image;
  final String description;
  final DateTime createdAt;
  final double lat;
  final double long;
  final String id;

  PropertyDto({
    required this.title,
    required this.city,
    required this.price,
    required this.image,
    required this.description,
    required this.createdAt,
    required this.lat,
    required this.long,
    required this.id,
  });

  factory PropertyDto.fromJson(Map<String, dynamic> json) => _$PropertyDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyDtoToJson(this);

  Property toDomain() => Property(
    title: title,
    city: city,
    price: price,
    image: image,
    description: description,
    createdAt: createdAt,
    lat: lat,
    long: long,
    id: id,
    type: PropertyType.random()
  );
}
