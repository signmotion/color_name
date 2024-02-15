part of '../../color_name.dart';

abstract class Palette<T> {
  const Palette(this.model, this.map);

  final ColorModel model;

  /// name, any T-declared type
  final Map<String, T> map;
}

/// The universal value for color.
/// See [ColorModel].
typedef UniColor = (double, double, double);

/// The universal palette for represent any color.
/// Use [ColorModel.rgb] with range double [0.0; 1.0].
class UniPalette extends Palette<UniColor> {
  const UniPalette(Map<String, UniColor> map) : super(ColorModel.rgb, map);
}

/// The palette for represent a color with 8-bits RGB channels into int value.
/// Use [ColorModel.rgb] with range integer [0; 255].
class Rgb8IntPalette extends Palette<int> {
  const Rgb8IntPalette(Map<String, int> map) : super(ColorModel.rgb, map);
}
