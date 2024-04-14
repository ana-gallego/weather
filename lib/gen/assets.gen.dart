/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/drops.svg
  String get drops => 'assets/icons/drops.svg';

  /// File path: assets/icons/mild.svg
  String get mild => 'assets/icons/mild.svg';

  $AssetsIconsWeatherGen get weather => const $AssetsIconsWeatherGen();

  /// File path: assets/icons/wind.svg
  String get wind => 'assets/icons/wind.svg';

  /// List of all assets
  List<String> get values => [drops, mild, wind];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/coffee-cup.png
  AssetGenImage get coffeeCup =>
      const AssetGenImage('assets/images/coffee-cup.png');

  /// File path: assets/images/coffee.png
  AssetGenImage get coffee => const AssetGenImage('assets/images/coffee.png');

  /// File path: assets/images/hot-chocolate.png
  AssetGenImage get hotChocolate =>
      const AssetGenImage('assets/images/hot-chocolate.png');

  /// File path: assets/images/ice-tea.png
  AssetGenImage get iceTea => const AssetGenImage('assets/images/ice-tea.png');

  /// File path: assets/images/mojito.png
  AssetGenImage get mojito => const AssetGenImage('assets/images/mojito.png');

  /// File path: assets/images/smoothies.png
  AssetGenImage get smoothies =>
      const AssetGenImage('assets/images/smoothies.png');

  /// File path: assets/images/soda.png
  AssetGenImage get soda => const AssetGenImage('assets/images/soda.png');

  /// File path: assets/images/wine-bottle.png
  AssetGenImage get wineBottle =>
      const AssetGenImage('assets/images/wine-bottle.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        coffeeCup,
        coffee,
        hotChocolate,
        iceTea,
        mojito,
        smoothies,
        soda,
        wineBottle
      ];
}

class $AssetsIconsWeatherGen {
  const $AssetsIconsWeatherGen();

  /// File path: assets/icons/weather/ic_01d.svg
  String get ic01d => 'assets/icons/weather/ic_01d.svg';

  /// File path: assets/icons/weather/ic_01n.svg
  String get ic01n => 'assets/icons/weather/ic_01n.svg';

  /// File path: assets/icons/weather/ic_02d.svg
  String get ic02d => 'assets/icons/weather/ic_02d.svg';

  /// File path: assets/icons/weather/ic_02n.svg
  String get ic02n => 'assets/icons/weather/ic_02n.svg';

  /// File path: assets/icons/weather/ic_03d.svg
  String get ic03d => 'assets/icons/weather/ic_03d.svg';

  /// File path: assets/icons/weather/ic_03n.svg
  String get ic03n => 'assets/icons/weather/ic_03n.svg';

  /// File path: assets/icons/weather/ic_04d.svg
  String get ic04d => 'assets/icons/weather/ic_04d.svg';

  /// File path: assets/icons/weather/ic_04n.svg
  String get ic04n => 'assets/icons/weather/ic_04n.svg';

  /// File path: assets/icons/weather/ic_09d.svg
  String get ic09d => 'assets/icons/weather/ic_09d.svg';

  /// File path: assets/icons/weather/ic_09n.svg
  String get ic09n => 'assets/icons/weather/ic_09n.svg';

  /// File path: assets/icons/weather/ic_10d.svg
  String get ic10d => 'assets/icons/weather/ic_10d.svg';

  /// File path: assets/icons/weather/ic_10n.svg
  String get ic10n => 'assets/icons/weather/ic_10n.svg';

  /// File path: assets/icons/weather/ic_11d.svg
  String get ic11d => 'assets/icons/weather/ic_11d.svg';

  /// File path: assets/icons/weather/ic_11n.svg
  String get ic11n => 'assets/icons/weather/ic_11n.svg';

  /// File path: assets/icons/weather/ic_13d.svg
  String get ic13d => 'assets/icons/weather/ic_13d.svg';

  /// File path: assets/icons/weather/ic_13n.svg
  String get ic13n => 'assets/icons/weather/ic_13n.svg';

  /// File path: assets/icons/weather/ic_50d.svg
  String get ic50d => 'assets/icons/weather/ic_50d.svg';

  /// File path: assets/icons/weather/ic_50n.svg
  String get ic50n => 'assets/icons/weather/ic_50n.svg';

  /// List of all assets
  List<String> get values => [
        ic01d,
        ic01n,
        ic02d,
        ic02n,
        ic03d,
        ic03n,
        ic04d,
        ic04n,
        ic09d,
        ic09n,
        ic10d,
        ic10n,
        ic11d,
        ic11n,
        ic13d,
        ic13n,
        ic50d,
        ic50n
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
