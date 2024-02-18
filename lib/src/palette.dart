part of '../uni_color_name.dart';

/// The [C] can be any structure.
/// See structures into the `README`.
abstract class Palette<C extends Object> {
  /// ! [map] should contains 1 model.
  const Palette(this.map);

  /// name, any [C]-declared type
  final Map<String, C> map;

  ColorModel get model;

  /// Number of colors.
  int get count => map.length;

  /// A closest color from this palette.
  //C closest(C color) {}

  /// A distance between colors.
}

/// The universal palette for represent any color as a [T]-typed value.
class UniPalette<T extends Object> extends Palette<UniColor<T>> {
  const UniPalette(super.map);

  factory UniPalette.file(String path, ColorModel model) {
    if (model != ColorModel.rgb) {
      throw UnimplementedError();
    }

    final s = WFile(path)
        .readAsJsonListT<List<dynamic>>()!
        .map((c) => c.map((v) => v as int).toList());
    final list =
        s.map((c) => c.colorRgbToUniColorShort<T>().withModel(ColorModel.rgb));
    final map = {for (var c in list) c.colorRgbToStringRgb: c};

    return UniPalette(map);
  }

  @override
  ColorModel get model => map.values.first.model;
}
