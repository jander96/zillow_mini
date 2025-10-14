import 'package:flutter/material.dart';
import 'package:zillow_mini/src/core/presenter/theme/color.dart';

class AppTypography {
  AppTypography._();

  static const fontFamily = 'Outfit';
  static const fontFamilySemiBold = 'Outfit-SemiBold';
  static const fontFamilyBold = 'Outfit-Bold';

  /// Base Text Style
  static const base = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
    decoration: TextDecoration.none,
    textBaseline: TextBaseline.alphabetic,
  );

  static  TextTheme textTheme = TextTheme(
    displayLarge: AppTypography.t28600,
    displayMedium: AppTypography.t28500,
    displaySmall: AppTypography.t24600,

    headlineLarge: AppTypography.t24500,
    headlineMedium: AppTypography.t20600,
    headlineSmall: AppTypography.t20500,

    titleLarge: AppTypography.t18600,
    titleMedium: AppTypography.t18500,
    titleSmall: AppTypography.t16600,

    bodyLarge: AppTypography.t14600,
    bodyMedium: AppTypography.t14500,
    bodySmall: AppTypography.t14400,

    labelLarge: AppTypography.t12600,
    labelMedium: AppTypography.t12500,
    labelSmall: AppTypography.t12400,
  );

  // Small Labels & Captions
  static TextStyle get t10400 => base.copyWith(fontSize: 10, fontWeight: FontWeight.w400); // Caption
  static TextStyle get t10500 => base.copyWith(fontSize: 10, fontWeight: FontWeight.w500);
  static TextStyle get t10600 => base.copyWith(fontSize: 10, fontWeight: FontWeight.w600);

  static TextStyle get t12400 => base.copyWith(fontSize: 12, fontWeight: FontWeight.w400); // Small text
  static TextStyle get t12500 => base.copyWith(fontSize: 12, fontWeight: FontWeight.w500);
  static TextStyle get t12600 => base.copyWith(fontSize: 12, fontWeight: FontWeight.w600, fontFamily: fontFamilySemiBold);
  static TextStyle get t12600P => base.copyWith(fontSize: 12, fontWeight: FontWeight.w600, fontFamily: fontFamilySemiBold,color: AppColor.primary);

  // Body text
  static TextStyle get t14400 => base.copyWith(fontSize: 14, fontWeight: FontWeight.w400); // Description
  static TextStyle get t14500 => base.copyWith(fontSize: 14, fontWeight: FontWeight.w500);
  static TextStyle get t14600 => base.copyWith(fontSize: 14, fontWeight: FontWeight.w600);
  static TextStyle get t14700 => base.copyWith(fontSize: 14, fontWeight: FontWeight.w700);
  static TextStyle get t14700P => base.copyWith(fontSize: 14, fontWeight: FontWeight.w700, color: AppColor.primary, fontFamily: fontFamilyBold);

  // Labels & section headers
  static TextStyle get t16500 => base.copyWith(fontSize: 16, fontWeight: FontWeight.w500);
  static TextStyle get t16600 => base.copyWith(fontSize: 16, fontWeight: FontWeight.w600);

  // Titles
  static TextStyle get t18500 => base.copyWith(fontSize: 18, fontWeight: FontWeight.w500); // AppBar title or item title
  static TextStyle get t18600 => base.copyWith(fontSize: 18, fontWeight: FontWeight.w600);

  static TextStyle get t20500 => base.copyWith(fontSize: 20, fontWeight: FontWeight.w500);
  static TextStyle get t20600 => base.copyWith(fontSize: 20, fontWeight: FontWeight.w600);

  // Headlines
  static TextStyle get t24500 => base.copyWith(fontSize: 24, fontWeight: FontWeight.w500); // Page title
  static TextStyle get t24600 => base.copyWith(fontSize: 24, fontWeight: FontWeight.w600);

  static TextStyle get t28500 => base.copyWith(fontSize: 28, fontWeight: FontWeight.w500);
  static TextStyle get t28600 => base.copyWith(fontSize: 28, fontWeight: FontWeight.w600);
  static TextStyle get t48700P => base.copyWith(fontSize: 48, fontWeight: FontWeight.bold, fontFamily: fontFamilyBold, color: AppColor.primary);
}