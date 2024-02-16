part of '../uni_color_name.dart';

abstract class Palette<T> {
  /// ! [map] should contains 1 model.
  const Palette(this.map);

  /// name, any T-declared type
  final Map<String, T> map;

  ColorModel get model;
}

/// The universal palette for represent any color as double values.
/// Use [ColorModel.rgb] with range double [0.0; 1.0].
/// `Uni` means `double`.
class UniPalette extends Palette<UniColor> {
  const UniPalette(super.map);

  @override
  ColorModel get model => map.values.first.model;
}

/// The universal palette for represent any color as int value.
/// Use [ColorModel.rgbInt8].
/// `Uni` means `double` therefore `Int` replaces `Uni`.
class Int8Palette extends Palette<(ColorModel, int)> {
  const Int8Palette(super.map);

  @override
  ColorModel get model => map.values.first.$1;
}
