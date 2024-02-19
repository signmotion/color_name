part of '../../uni_color_name.dart';

/// An access to color as CMYK model.
extension ColorNameCmykUniColorExt<T> on UniColor<T> {
  T get cyan => $2;
  T get magenta => $3;
  T get yellow => $4;
}

/// An access to color as HSL model.
extension ColorNameHslUniColorExt<T> on UniColor<T> {
  T get hue => $2;
  T get saturation => $3;
  T get lightness => $4;
}

/// An access to color as RGB model.
extension ColorNameRgbUniColorExt<T> on UniColor<T> {
  T get red => $2;
  T get green => $3;
  T get blue => $4;
}

/// An access to color as XYZ model.
extension ColorNameXyzUniColorExt<T> on UniColor<T> {
  T get x => $2;
  T get y => $3;
  T get z => $4;
}

/// A simple arithmetic.
extension ColorNameMathUniColorExt<T extends num> on UniColor<T> {
  UniColor<T> add(UniColor<T> b) {
    assertSameModel(b);
    assertRgbModel();
    return ($1, ($2 + b.$2) as T, ($3 + b.$3) as T, ($4 + b.$4) as T);
  }

  UniColor<T> mulpiply(UniColor<T> b) {
    assertSameModel(b);
    assertRgbModel();
    return ($1, ($2 * b.$2) as T, ($3 * b.$3) as T, ($4 * b.$4) as T);
  }

  UniColor<T> subtract(UniColor<T> b) {
    assertSameModel(b);
    assertRgbModel();
    return ($1, ($2 - b.$2) as T, ($3 - b.$3) as T, ($4 - b.$4) as T);
  }

  /// this ^ 2
  UniColor<T> get square =>
      ($1, ($2 * $2) as T, ($3 * $3) as T, ($4 * $4) as T);

  /// channel 1 + channel 2 + channel 3
  T get summarize => ($2 + $3 + $4) as T;
}

/// The checkers.
extension ColorNameCheckUniColorExt<T> on UniColor<T> {
  bool sameModel(UniColor<T> b) => model == b.model;

  void assertSameModel(UniColor<T> b) {
    if (model != b.model) {
      throw ArgumentError('The color models should be same.'
          ' $model != ${b.model}');
    }
  }

  void assertRgbModel() {
    if (model == ColorModel.rgb) {
    } else {
      throw ArgumentError('The color models should be RGB. `$model`');
    }
  }
}

/// A template for naming convertors:
/// `color[SourceModel]To[Structure][ResultModel]()`
extension ColorNameUniColorExt<T> on UniColor<T> {
  /// Access to model.
  ColorModel get model => $1;

  /// See [ColorNameUniColorShortExt.withModel].
  UniColorShort<T> get withoutModel => ($2, $3, $4);

  /// Convert to [UniColor] doubles.
  UniColor<double> get colorToUniColorDouble => switch (this) {
        UniColor<double> c => c,
        UniColor<int> c => (
            c.model,
            c.$2.toDouble(),
            c.$3.toDouble(),
            c.$4.toDouble()
          ),
        UniColor<String> c => throw UnimplementedError('$c'),
        _ => throw UnsupportedError('$runtimeType'),
      };

  /// Convert to [UniColor] integers.
  UniColor<int> get colorToUniColorInt => switch (this) {
        UniColor<double> c => c.colorToRound,
        UniColor<int> c => c,
        UniColor<String> c => throw UnimplementedError('$c'),
        _ => throw UnsupportedError('$runtimeType'),
      };

  List<T> get colorToList => [$2, $3, $4];

  String get colorRgbToStringRgb => switch (this) {
        UniColor<int> c => c.colorRgbToIntRgb.colorRgbToStringRgb,
        UniColor<double> c => c.colorToScaledIntColor(255).colorRgbToStringRgb,
        UniColor<String> c => '${c.red.padLeft(2, '0')}'
            '${c.green.padLeft(2, '0')}'
            '${c.blue.padLeft(2, '0')}',
        _ => throw ArgumentError(),
      };

  /// Round by defined decimal places.
  UniColor<double> colorToRoundDecimals(int decimals) => switch (this) {
        UniColor<double> c => c.colorToRoundDecimals(decimals),
        UniColor<int> c => c.colorToUniColorDouble,
        UniColor<String> c => throw UnimplementedError('$c'),
        _ => throw UnsupportedError('$runtimeType'),
      };
}

/// A template for naming convertors:
/// `color[SourceModel]To[Structure][ResultModel]()`
extension ColorNameUniColorDoubleExt on UniColor<double> {
  // TODO(sign): C convertToModel<C>(ColorModel model) => ...

  /// Round to [UniColor] integers.
  UniColor<int> get colorToRound => (
        model,
        $2.roundToDecimals(0).round(),
        $3.roundToDecimals(0).round(),
        $4.roundToDecimals(0).round()
      );

  /// Round by defined decimal places.
  UniColor<double> colorToRoundDecimals(int decimals) => decimals < 0
      ? this
      : (
          model,
          $2.roundToDecimals(decimals),
          $3.roundToDecimals(decimals),
          $4.roundToDecimals(decimals)
        );

  /// Multiply by [k].
  UniColor<int> colorToScaledIntColor(int k) =>
      (model, $2 * k, $3 * k, $4 * k).colorToRound;

  /// Divide by [k].
  UniColor<double> colorToScaleDoubleColor(double k, [int decimals = 0]) =>
      (model, $2 / k, $3 / k, $4 / k).colorToRoundDecimals(decimals);

  int get colorRgbToIntRgb => colorToScaledIntColor(255).colorRgbToIntRgb;
}

/// A template for naming convertors:
/// `color[SourceModel]To[Structure][ResultModel]()`
extension ColorNameUniColorIntExt on UniColor<int> {
  /// Divide by [k].
  UniColor<double> colorToScaleDoubleColor(double k, [int decimals = 0]) =>
      (model, $2 / k, $3 / k, $4 / k).colorToRoundDecimals(decimals);

  int get colorRgbToIntRgb => colorToList.colorRgbToIntRgb;

  /// Returns a 1-dimension index for the channel range [0; 255].
  int get i256 => $2 + $3 * 256 + $4 * 256 * 256;
}

extension ColorNameUniColorShortExt<T> on UniColorShort<T> {
  /// See [ColorNameUniColorExt.withoutModel].
  UniColor<T> withModel(ColorModel model) => (model, $1, $2, $3);
}

extension ColorNameListExt<T> on List<T> {
  UniColorShort<T> get colorRgbToUniColorShort => (this[0], this[1], this[2]);

  UniColor<T> get colorRgbToUniColorRgb =>
      (ColorModel.rgb, this[0], this[1], this[2]);
}

extension ColorNameListIntExt on List<int> {
  int get colorRgbToIntRgb =>
      (((this[0] & 0xff) << 16) |
          ((this[1] & 0xff) << 8) |
          ((this[2] & 0xff) << 0)) &
      0xFFFFFF;
}

extension ColorNameIntExt on int {
  /// The first (red in RGB model) channel of this color in an 8 bit value.
  int get colorChannel1 => (0xff0000 & this) >> 16;

  /// The second (green in RGB model) channel of this color in an 8 bit value.
  int get colorChannel2 => (0x00ff00 & this) >> 8;

  /// The third (blue in RGB model) channel of this color in an 8 bit value.
  int get colorChannel3 => (0x0000ff & this) >> 0;

  UniColor<T> colorRgbToUniColorRgb<T>() =>
      colorRgbToUniColorShort<T>().withModel(ColorModel.rgb);

  UniColorShort<T> colorRgbToUniColorShort<T>() =>
      (colorChannel1 as T, colorChannel2 as T, colorChannel3 as T);

  String get colorRgbToStringRgb => toRadixString(16).padLeft(6, '0');
}
