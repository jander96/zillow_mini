import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:zillow_mini/resources/resources.dart';

void main() {
  test('app_icons assets test', () {
    expect(File(AppIcons.apartmentSvgrepoCom).existsSync(), isTrue);
    expect(File(AppIcons.beachChairSummerSvgrepoCom).existsSync(), isTrue);
    expect(File(AppIcons.cabinSvgrepoCom).existsSync(), isTrue);
    expect(
      File(
        AppIcons.ecologyEnergyHouseFarmHouseGreenHouseSvgrepoCom,
      ).existsSync(),
      isTrue,
    );
    expect(File(AppIcons.house03SvgrepoCom).existsSync(), isTrue);
    expect(File(AppIcons.loftBuildingSvgrepoCom).existsSync(), isTrue);
    expect(File(AppIcons.mansionSoSvgrepoCom).existsSync(), isTrue);
    expect(File(AppIcons.studioSvgrepoCom).existsSync(), isTrue);
    expect(File(AppIcons.townHouseSvgrepoCom).existsSync(), isTrue);
    expect(File(AppIcons.villaSvgrepoCom).existsSync(), isTrue);
  });
}
