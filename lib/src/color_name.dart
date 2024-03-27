part of '../uni_color_name.dart';

/// [T] Full color presentation.
abstract class ColorName<T extends C, P extends Palette<T>> {
  const ColorName(this.palette);

  final P palette;

  ColorModel get model => palette.model;

  /// A value of color by [name].
  /// Use a [ColorNameStringExt.normalizedNameColor] for search.
  T? value(String name) => palette[name] ?? palette[name.normalizedNameColor];

  /// A name of color by [color] with model (full color represenation).
  /// Match with respects to [decimals].
  String? name(T color, {int decimals = -1});
}

/// A class for work with [UniPalette] and [UniColor] defined into [palette].
/// If [palette] is not defined use [UniPalette] with all known palettes.
class UniColorName<T extends C> extends ColorName<T, UniPalette<T>> {
  const UniColorName(super.palette);

  @override
  String? name(T color, {int decimals = -1}) =>
      _name(color, decimals: decimals);

  String? _name(T color, {int decimals = -1}) {
    for (final c in palette.list) {
      if (!color.sameModel(c)) {
        // TODO(sign): Convert between models.
        throw UnimplementedError('Different models.'
            ' ${color.model} != ${c.model}');
      }

      // match with precission
      if (color.equalChannels(c, decimals: decimals)) {
        return c.name;
      }
    }

    return null;
  }
}
