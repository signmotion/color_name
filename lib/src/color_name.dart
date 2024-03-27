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

  /// A closest color from the [palette].
  /// See [ColorDistance].
  T closest(T color, ColorDistance cd);
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

  // @override
  // TODO(sign): (String, UniColor<T>) closest(UniColor<T> color, ColorDistance cd) {
  //   _points ??= [
  //     for (final entry in map.entries)
  //       {
  //         'x': entry.value.red,
  //         'y': entry.value.green,
  //         'z': entry.value.blue,
  //         'name': entry.key,
  //       }
  //   ];

  //   double distance(Map<dynamic, dynamic> a, Map<dynamic, dynamic> b) {
  //     final aa = (model, a['x'] as T, a['y'] as T, a['z'] as T);
  //     final bb = (model, b['x'] as T, b['y'] as T, b['z'] as T);

  //     return cd.distance(aa, bb);
  //   }

  //   _kdtree ??= KDTree(_points!, distance, ['x', 'y', 'z']);

  //   final nearest = _kdtree!.nearest(
  //     {
  //       'x': color.red,
  //       'y': color.green,
  //       'z': color.blue,
  //     },
  //     1,
  //   );

  //   final r = (nearest.single as List<dynamic>).first as Map<String, dynamic>;
  //   final c = (model, r['x'] as T, r['y'] as T, r['z'] as T);

  //   return (r['name'] as String, c);
  // }

  // KDTree? _kdtree;
  // List<Map<String, dynamic>>? _points;

  @override
  T closest(T color, ColorDistance cd) {
    // respect JavaScript limitation
    final maxIntValue = pow(2, 53).round() - 1;
    var min = maxIntValue.toDouble();
    late T found;
    for (final other in palette.list) {
      final d = cd.distance(color, other);
      if (d < min) {
        min = d;
        found = other;
      }
    }

    return found;
  }
}
