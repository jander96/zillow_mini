import 'package:flutter/material.dart';
import 'package:zillow_mini/src/core/presenter/theme/color.dart';
import 'package:zillow_mini/src/core/presenter/theme/typography.dart';

final ThemeData lightTheme = ThemeData(
  colorScheme: AppColor.lightColorScheme,
  useMaterial3: true,
  fontFamily: AppTypography.fontFamily,
  textTheme: AppTypography.textTheme,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColor.lightColorScheme.primary,
    foregroundColor: AppColor.lightColorScheme.onPrimary,
    iconTheme: IconThemeData(color: AppColor.lightColorScheme.onPrimary),
    elevation: 0,
    actionsPadding: EdgeInsets.only(right: 8),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColor.lightColorScheme.primary,
    foregroundColor: AppColor.lightColorScheme.onPrimary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColor.lightColorScheme.primary,
      foregroundColor: AppColor.lightColorScheme.onPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
  textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: AppColor.lightColorScheme.primary)),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(foregroundColor: WidgetStateProperty.all(AppColor.lightColorScheme.primary)),
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: AppColor.lightColorScheme.surfaceContainerHighest,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColor.lightColorScheme.onSurface, width: 1),
    ),
    hintStyle: TextStyle(color: AppColor.lightColorScheme.onSurfaceVariant),
    labelStyle: TextStyle(color: AppColor.lightColorScheme.onSurface),
  ),
);

final ThemeData darkTheme = ThemeData(
  colorScheme: AppColor.darkColorScheme,
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColor.darkColorScheme.primary,
    foregroundColor: AppColor.darkColorScheme.onPrimary,
    iconTheme: IconThemeData(color: AppColor.darkColorScheme.onPrimary),
    elevation: 0,
    actionsPadding: EdgeInsets.only(right: 8),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColor.darkColorScheme.primary,
    foregroundColor: AppColor.darkColorScheme.onPrimary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColor.darkColorScheme.primary,
      foregroundColor: AppColor.darkColorScheme.onPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
  textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: AppColor.darkColorScheme.primary)),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(foregroundColor: WidgetStateProperty.all(AppColor.darkColorScheme.primary)),
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: AppColor.darkColorScheme.surfaceContainerHighest,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColor.lightColorScheme.onSurface, width: 1),
    ),
    hintStyle: TextStyle(color: AppColor.darkColorScheme.onSurfaceVariant),
    labelStyle: TextStyle(color: AppColor.darkColorScheme.onSurface),
  ),
);
