
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zillow_mini/resources/resources.dart' show AppIcons;
import 'package:zillow_mini/src/core/domain/models/property.dart';
import 'package:zillow_mini/src/core/domain/models/property_type.dart';
import 'package:zillow_mini/src/core/presenter/extensions/currency_extensions.dart';
import 'package:zillow_mini/src/core/presenter/extensions/datetime_extensions.dart';

class PropertyUI {
  final String title;
  final String city;
  final String formatedPrice;
  final String image;
  final String description;
  final String formatedCreatedAt;
  final LatLng latLng;
  final String id;
  final PropertyType type;
  final SvgPicture typeIcon;

  const PropertyUI({
    required this.title,
    required this.city,
    required this.formatedPrice,
    required this.image,
    required this.description,
    required this.formatedCreatedAt,
    required this.latLng,
    required this.id,
    required this.type,
    required this.typeIcon,

  });

  factory PropertyUI.fromDomain(Property property) => PropertyUI(
    title: property.title,
    city: property.city,
    formatedPrice: double.parse(property.price).toUSD,
    image: property.image,
    description: property.description,
    formatedCreatedAt: property.createdAt.toShortDate,
    latLng: LatLng(property.lat, property.long),
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
    }
  );
}
