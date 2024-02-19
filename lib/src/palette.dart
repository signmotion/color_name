part of '../uni_color_name.dart';

/// The [C] can be any structure.
/// See structures into the `README`.
abstract class Palette<C extends Object> {
  /// ! [map] should contains 1 model.
  const Palette(this.map);

  /// name, any [C]-declared type
  final Map<String, C> map;

  /// Number of colors.
  int get count => map.length;

  ColorModel get model;

  /// A closest color from this palette.
  /// See [ColorDistance].
  /// <name, C>
  (String, C) closest(C color, ColorDistance cd);
}

/// The universal palette for represent any color as a [T]-typed value.
class UniPalette<T extends Object> extends Palette<UniColor<T>> {
  const UniPalette(super.map);

  factory UniPalette.file(String path, ColorModel model) {
    if (model != ColorModel.rgb) {
      throw UnimplementedError();
    }

    final l = WFile(path).readAsJsonListListT<int>();
    if (l == null) {
      throw ArgumentError('The file `$path` not found.');
    }

    if (l.length < 2) {
      throw ArgumentError(
          'The palette file should contain 2 or more colors. We have: $l');
    }

    final list =
        l.map((c) => c.colorRgbToUniColorShort<T>().withModel(ColorModel.rgb));
    final map = {for (var c in list) c.colorRgbToStringRgb: c};

    return UniPalette(map);
  }

  @override
  ColorModel get model => map.values.first.model;

  @override
  (String, UniColor<T>) closest(UniColor<T> color, ColorDistance cd) {
    // respect JavaScript limitation
    final maxIntValue = pow(2, 53).round() - 1;
    var min = maxIntValue.toDouble();
    late MapEntry<String, UniColor<T>> found;
    for (final e in map.entries) {
      final d = cd.distance(color, e.value);
      if (d < min) {
        min = d;
        found = e;
      }
    }

    // TODO(sign): optimize Bake the colors to quad-tree.

    return (found.key, found.value);
  }
}
