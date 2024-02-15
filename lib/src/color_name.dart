part of '../../color_name.dart';

abstract class ColorName<T, P extends Palette<T>> {
  const ColorName({required this.palette});

  final P palette;

  /// A value of color by [name].
  /// Use a [ColorNameOnStringExt.normalizedNameColor] for search.
  T? value(String name) =>
      palette.map[name] ?? palette.map[name.normalizedNameColor];

  /// A name of color by [value].
  /// Match with respects to [decimalPlaces].
  String? name(T value, {int decimalPlaces = -1});
}

/// A class for work with [UniPalette] and [UniColor] defined into [palette].
/// If [palette] is not defined use [UniPalette] with all known palettes.
class UniColorName extends ColorName<UniColor, UniPalette> {
  const UniColorName({
    super.palette = const UniPalette(Palletes.all),
  });

  @override
  String? name(UniColor value, {int decimalPlaces = -1}) {
    for (final e in palette.map.entries) {
      // match with precission
      if (e.value.roundToDecimalPlaces(decimalPlaces) ==
          value.roundToDecimalPlaces(decimalPlaces)) {
        return e.key;
      }
    }

    return null;
  }
}
