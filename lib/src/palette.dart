part of '../uni_color_name.dart';

/// A palette with colors [C].
/// See structures into the `README`.
abstract class Palette<T extends C> {
  /// ! [map] should contains 1 model.
  const Palette(this.list) : assert(list.length > 1);

  /// List of all colors [T].
  final List<T> list;

  ColorModel get model => list.first.model;

  /// Number of colors.
  int get count => list.length;

  /// Color [T] by name.
  T? operator [](String colorName) =>
      list.firstWhereOrNull((c) => c.hasName && c.name == colorName);

  /// A closest color from this palette.
  /// See [ColorDistance].
  T closest(T color, ColorDistance cd);
}

/// The universal palette for represent any color as a [T]-typed value.
/// Adding an alpha when absent.
class UniPalette<T extends C> extends Palette<T> {
  UniPalette(super.list);

  /// Constructing from [File].
  /// See [UniPalette.iterable].
  factory UniPalette.file(
    String path,
    ColorModel model, {
    List<int> channelDepths = const [8, 8, 8, 8],
  }) {
    if (model != ColorModel.rgb) {
      throw UnimplementedError('$model');
    }
    if (channelDepths != const [8, 8, 8, 8]) {
      throw UnimplementedError('Channel depths `$channelDepths`.');
    }

    final l = WFile(path).readAsJsonListListT<int>();
    if (l == null) {
      throw ArgumentError('The file `$path` not found.');
    }

    final list = l.map((c) {
      final hasAlpha = c.length == 4;
      final pc = hasAlpha ? c : [0xff, ...c];
      return pc.colorArgbToInt8Argb;
    });

    return UniPalette.iterableInt(list, model);
  }

  /// Constructing from [Iterable<int>].
  factory UniPalette.iterableInt(
    Iterable<int> iterable,
    ColorModel model, {
    List<int> channelDepths = const [8, 8, 8, 8],
  }) {
    if (model != ColorModel.rgb) {
      throw UnimplementedError('$model');
    }
    if (channelDepths != const [8, 8, 8, 8]) {
      throw UnimplementedError('Channel depths `$channelDepths`.');
    }

    if (iterable.length < 2) {
      throw ArgumentError('The palette should contain 2 or more colors.'
          ' We have: ${iterable.length} $iterable');
    }

    final list = [for (final v in iterable) v.argbInt8Color] as List<T>;

    return UniPalette(list);
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
    for (final other in list) {
      final d = cd.distance(color, other);
      if (d < min) {
        min = d;
        found = other;
      }
    }

    return found;
  }
}
