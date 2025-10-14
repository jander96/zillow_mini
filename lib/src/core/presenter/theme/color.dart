import 'package:flutter/material.dart';

final class AppColor {
  const AppColor._();
  static const Color primary = Color(0xFF0D3B66);
  static const Color primaryVariant = Color(0xFF092B4C);

  static const Color secondary = Color(0xFF6C63FF);
  static const Color secondaryVariant = Color(0xFFA7B9FA);

  static const Color surface = Color(0xFFFFFFFF);
  static const Color onSurface = Color(0xFF000000);

  static const Color error = Color(0xFFF44336);
  static const Color onError = Color(0xFFFFFFFF);

  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onSecondary = Color(0xFFFFFFFF);

  static const Color primaryDark = Color(0xFF133A5E);
  static const Color primaryVariantDark = Color(0xFF001F3F);

  static const Color secondaryDark = Color(0xFF7E57C2);
  static const Color secondaryVariantDark = Color(0xFF9575CD);

  static const Color surfaceDark = Color(0xFF2C2C2C);
  static const Color onSurfaceDark = Color(0xFFFFFFFF);

  static const Color errorDark = Color(0xFFD32F2F);
  static const Color onErrorDark = Color(0xFF000000);

  static const Color onPrimaryDark = Color(0xFFFFFFFF);
  static const Color onSecondaryDark = Color(0xFFFFFFFF);

  static const Color tertiary = Color(0xFFFFC107);
  static const Color priceTextColor = Color(0xFF0D3B66);

  static const Color gray = Color(0xFF707070);
  static const Color grayLight = Color(0xFFDADADA);

  static const Color red = Color(0xFFAA1818);
  static const Color pinkAccent = Color(0xFFEC407A);

  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColor.primary,
    onPrimary: AppColor.onPrimary,
    primaryContainer: AppColor.primaryVariant,
    onPrimaryContainer: AppColor.onPrimary,
    secondary: AppColor.secondary,
    onSecondary: AppColor.onSecondary,
    secondaryContainer: AppColor.secondaryVariant,
    onSecondaryContainer: AppColor.onSecondary,
    tertiary: AppColor.tertiary,
    onTertiary: Colors.black,
    tertiaryContainer: AppColor.grayLight,
    onTertiaryContainer: Colors.black,
    error: AppColor.error,
    onError: AppColor.onError,
    errorContainer: AppColor.red,
    onErrorContainer: AppColor.onError,
    surface: AppColor.surface,
    onSurface: AppColor.onSurface,
    surfaceContainerHighest: AppColor.grayLight,
    onSurfaceVariant: AppColor.gray,
    outline: AppColor.gray,
    shadow: Colors.black12,
    inverseSurface: AppColor.surfaceDark,
    onInverseSurface: AppColor.onSurfaceDark,
    inversePrimary: AppColor.primaryDark,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColor.primaryDark,
    onPrimary: AppColor.onPrimaryDark,
    primaryContainer: AppColor.primaryVariantDark,
    onPrimaryContainer: AppColor.onPrimaryDark,
    secondary: AppColor.secondaryDark,
    onSecondary: AppColor.onSecondaryDark,
    secondaryContainer: AppColor.secondaryVariantDark,
    onSecondaryContainer: AppColor.onSecondaryDark,
    tertiary: AppColor.tertiary,
    onTertiary: Colors.black,
    tertiaryContainer: AppColor.gray,
    onTertiaryContainer: Colors.white,
    error: AppColor.errorDark,
    onError: AppColor.onErrorDark,
    errorContainer: AppColor.red,
    onErrorContainer: AppColor.onErrorDark,
    surface: AppColor.surfaceDark,
    onSurface: AppColor.onSurfaceDark,
    surfaceContainerHighest: AppColor.gray,
    onSurfaceVariant: AppColor.grayLight,
    outline: AppColor.grayLight,
    shadow: Colors.black87,
    inverseSurface: AppColor.surface,
    onInverseSurface: AppColor.onSurface,
    inversePrimary: AppColor.primary,
  );
}