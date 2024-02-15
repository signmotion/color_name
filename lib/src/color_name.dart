part of '../uni_color_name.dart';

/// [C] Full color representation.
abstract class ColorName<C, P extends Palette<C>> {
  const ColorName({required this.palette});

  final P palette;

  ColorModel get model => palette.model;

  /// A value of color by [name].
  /// Use a [ColorNameOnStringExt.normalizedNameColor] for search.
  C? value(String name) =>
      palette.map[name] ?? palette.map[name.normalizedNameColor];

  /// A name of color by [value] with model (full color represenation).
  /// Match with respects to [decimals].
  String? name<A>(A value, {int decimals = -1});
}

/// A class for work with [UniPalette] and [UniColor] defined into [palette].
/// If [palette] is not defined use [UniPalette] with all known palettes.
class UniColorName extends ColorName<UniColor, UniPalette> {
  const UniColorName({
    super.palette = const UniPalette(Palletes.all),
  });

  @override
  String? name<A>(A value, {int decimals = -1}) => switch (value) {
        UniColor c => _name(c, decimals: decimals),
        UniColorShort cs => _name(cs.withModel(model), decimals: decimals),
        _ => null,
      };

  String? _name(UniColor value, {int decimals = -1}) {
    // TODO(sign): Convert between models.
    assert(model == value.model, 'Different models. TODO');

    for (final e in palette.map.entries) {
      // match with precission
      if (e.value.colorToRoundDecimals(decimals) ==
          value.colorToRoundDecimals(decimals)) {
        return e.key;
      }
    }

    return null;
  }
}
