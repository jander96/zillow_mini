import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zillow_mini/resources/resources.dart' show AppIcons;
import 'package:zillow_mini/src/core/domain/models/property.dart';
import 'package:zillow_mini/src/core/domain/models/property_type.dart';
import 'package:zillow_mini/src/core/presenter/extensions/currency_extensions.dart';
import 'package:zillow_mini/src/core/presenter/extensions/datetime_extensions.dart';

class PropertyUI {
  final String title;
  final String city;
  final double price;
  final String image;
  final String description;
  final String formatedCreatedAt;
  final LatLng latLng;
  final String id;
  final PropertyType type;
  final SvgPicture typeIcon;
  final int bedrooms;
  final int bathrooms;
  final int laundryRoom;
  final int otherFacilities;

  const PropertyUI({
    required this.title,
    required this.city,
    required this.price,
    required this.image,
    required this.description,
    required this.formatedCreatedAt,
    required this.latLng,
    required this.id,
    required this.type,
    required this.typeIcon,
    required this.bedrooms,
    required this.bathrooms,
    required this.laundryRoom,
    required this.otherFacilities,
  });

  factory PropertyUI.empty() => PropertyUI(
    title: '',
    city: '',
    price: 0,
    image: 'https://api.dicebear.com/8.x/avataaars/png?seed=Jander%20Laffita',
    description: '',
    formatedCreatedAt: '',
    latLng: LatLng(lat: 0, long: 0),
    id: '',
    type: PropertyType.condo,
    typeIcon: SvgPicture.asset(AppIcons.beachChairSummerSvgrepoCom),
    bedrooms: 1,
    bathrooms: 1,
    laundryRoom: 1,
    otherFacilities: 1,
  );

  factory PropertyUI.fromDomain(Property property) => PropertyUI(
    title: property.title,
    city: property.city,
    price: double.parse(property.price),
    image: property.image,
    description: property.description,
    formatedCreatedAt: property.createdAt.toShortDate,
    latLng: LatLng(lat: property.lat, long: property.long),
    id: property.id,
    type: property.type,
    typeIcon: switch (property.type) {
      PropertyType.beachHouse => SvgPicture.asset(AppIcons.beachChairSummerSvgrepoCom),
      PropertyType.apartment => SvgPicture.asset(AppIcons.apartmentSvgrepoCom),
      PropertyType.villa => SvgPicture.asset(AppIcons.villaSvgrepoCom),
      PropertyType.townhouse => SvgPicture.asset(AppIcons.townHouseSvgrepoCom),
      PropertyType.penthouse => SvgPicture.asset(AppIcons.mansionSoSvgrepoCom),
      PropertyType.condo => SvgPicture.asset(AppIcons.house03SvgrepoCom),
      PropertyType.studio => SvgPicture.asset(AppIcons.studioSvgrepoCom),
      PropertyType.loft => SvgPicture.asset(AppIcons.loftBuildingSvgrepoCom),
      PropertyType.cabin => SvgPicture.asset(AppIcons.cabinSvgrepoCom),
      PropertyType.farmHouse => SvgPicture.asset(AppIcons.ecologyEnergyHouseFarmHouseGreenHouseSvgrepoCom),
    },
    bedrooms: Random().nextInt(10) + 1,
    bathrooms: Random().nextInt(10) + 1,
    laundryRoom: Random().nextInt(10) + 1,
    otherFacilities: Random().nextInt(10) + 1,
  );

  String localizedPrice(BuildContext context) {
    return price.localizePrice(context);
  }
}

class LatLng {
  final double lat;
  final double long;

  LatLng({required this.lat, required this.long});
}
