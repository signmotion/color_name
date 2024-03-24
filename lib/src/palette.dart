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
  UniPalette(super.map);

  /// Constructing from [File].
  /// See [UniPalette.list].
  factory UniPalette.file(String path, ColorModel model) {
    final l = WFile(path).readAsJsonListListT<int>();
    if (l == null) {
      throw ArgumentError('The file `$path` not found.');
    }

    final list = l.map((c) => c.colorRgbToInt8Rgb);

    return UniPalette.list(list as Iterable<T>, model);
  }

  /// Constructing from [Iterable].
  factory UniPalette.list(Iterable<T> list, ColorModel model) {
    if (model != ColorModel.rgb) {
      throw UnimplementedError();
    }

    if (list.length < 2) {
      throw ArgumentError('The palette should contain 2 or more colors.'
          ' We have: ${list.length} $list');
    }

    final map = <String, UniColor<T>>{};
    for (final c in list) {
      final entry = switch (c) {
        int v => MapEntry(v.colorRgbToStringRgb, v.colorRgbToUniColorRgb<T>()),
        _ => throw ArgumentError('$c'),
      };
      map[entry.key] = entry.value;
    }

    return UniPalette(map);
  }

  @override
  ColorModel get model => map.values.first.model;

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

    return (found.key, found.value);
  }
}
