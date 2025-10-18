// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Outfit-VariableFont_wght.ttf
  String get outfitVariableFontWght =>
      'assets/fonts/Outfit-VariableFont_wght.ttf';

  /// List of all assets
  List<String> get values => [outfitVariableFontWght];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/apartment-svgrepo-com.svg
  String get apartmentSvgrepoCom => 'assets/icons/apartment-svgrepo-com.svg';

  /// File path: assets/icons/beach-chair-summer-svgrepo-com.svg
  String get beachChairSummerSvgrepoCom =>
      'assets/icons/beach-chair-summer-svgrepo-com.svg';

  /// File path: assets/icons/cabin-svgrepo-com.svg
  String get cabinSvgrepoCom => 'assets/icons/cabin-svgrepo-com.svg';

  /// File path: assets/icons/ecology-energy-house-farm-house-green-house-svgrepo-com.svg
  String get ecologyEnergyHouseFarmHouseGreenHouseSvgrepoCom =>
      'assets/icons/ecology-energy-house-farm-house-green-house-svgrepo-com.svg';

  /// File path: assets/icons/house-03-svgrepo-com.svg
  String get house03SvgrepoCom => 'assets/icons/house-03-svgrepo-com.svg';

  /// File path: assets/icons/ic_launcher.png
  AssetGenImage get icLauncher =>
      const AssetGenImage('assets/icons/ic_launcher.png');

  /// File path: assets/icons/loft-building-svgrepo-com.svg
  String get loftBuildingSvgrepoCom =>
      'assets/icons/loft-building-svgrepo-com.svg';

  /// File path: assets/icons/mansion-so-svgrepo-com.svg
  String get mansionSoSvgrepoCom => 'assets/icons/mansion-so-svgrepo-com.svg';

  /// File path: assets/icons/studio-svgrepo-com.svg
  String get studioSvgrepoCom => 'assets/icons/studio-svgrepo-com.svg';

  /// File path: assets/icons/town-house-svgrepo-com.svg
  String get townHouseSvgrepoCom => 'assets/icons/town-house-svgrepo-com.svg';

  /// File path: assets/icons/villa-svgrepo-com.svg
  String get villaSvgrepoCom => 'assets/icons/villa-svgrepo-com.svg';

  /// List of all assets
  List<dynamic> get values => [
    apartmentSvgrepoCom,
    beachChairSummerSvgrepoCom,
    cabinSvgrepoCom,
    ecologyEnergyHouseFarmHouseGreenHouseSvgrepoCom,
    house03SvgrepoCom,
    icLauncher,
    loftBuildingSvgrepoCom,
    mansionSoSvgrepoCom,
    studioSvgrepoCom,
    townHouseSvgrepoCom,
    villaSvgrepoCom,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/profile_placeholder.png
  AssetGenImage get profilePlaceholder =>
      const AssetGenImage('assets/images/profile_placeholder.png');

  /// List of all assets
  List<AssetGenImage> get values => [profilePlaceholder];
}

class $AssetsRawGen {
  const $AssetsRawGen();

  /// File path: assets/raw/user_table.json
  String get userTable => 'assets/raw/user_table.json';

  /// List of all assets
  List<String> get values => [userTable];
}

class Assets {
  const Assets._();

  static const String aEnv = '.env';
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsRawGen raw = $AssetsRawGen();

  /// List of all assets
  static List<String> get values => [aEnv];
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
