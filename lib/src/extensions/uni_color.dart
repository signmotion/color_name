part of '../../uni_color_name.dart';

/// A template for naming convertors:
///   - `typeToType`
///   - `typeToModelType`
///   - `modelTypeToType`
/// We discard `uni`.
extension ColorNameUniColorExt on UniColor {
  /// Access to model.
  ColorModel get model => $1;

  /// See [ColorNameUniColorShortExt.withModel].
  UniColorShort get withoutModel => ($2, $3, $4);

  // TODO(sign): C convertToModel<C>(ColorModel model) => ...

  /// Round to integers.
  /// Alias [colorToIntColor].
  IntColor get colorToRound => (
        model,
        $2.roundToDecimals(0).round(),
        $3.roundToDecimals(0).round(),
        $4.roundToDecimals(0).round()
      );

  /// Alias [colorToRound].
  IntColor get colorToIntColor => colorToRound;

  /// Round by defined decimal places.
  UniColor colorToRoundDecimals(int decimals) => decimals < 0
      ? this
      : (
          model,
          $2.roundToDecimals(decimals),
          $3.roundToDecimals(decimals),
          $4.roundToDecimals(decimals)
        );

  IntColor colorToScaledIntColor(int k) =>
      (model, $2 * k, $3 * k, $4 * k).colorToRound;

  int get colorToRgbInt8 => colorToScaledIntColor(255).intColorToRgbInt8;

  List<int> get colorToListRgbInt8 => [
        ($2 * 255).round(),
        ($3 * 255).round(),
        ($4 * 255).round(),
      ];
}

extension ColorNameUniColorShortExt on UniColorShort {
  /// See [ColorNameUniColorExt.withoutModel].
  UniColor withModel(ColorModel model) => (model, $1, $2, $3);
}

extension ColorNameIntUniColorExt on IntColor {
  /// Access to model.
  ColorModel get model => $1;

  /// See [ColorNameIntColorShortExt.withModel].
  IntColorShort get withoutModel => ($2, $3, $4);

  // TODO(sign): C convertToModel<C>(ColorModel model) => ...

  /// Convert to doubles.
  UniColor get intColorToColor =>
      (model, $2.toDouble(), $3.toDouble(), $4.toDouble());

  UniColor scaleToDoubleColor(double k, [int decimals = 0]) =>
      (model, $2 / k, $3 / k, $4 / k).colorToRoundDecimals(decimals);

  int get intColorToRgbInt8 => intColorToListRgbInt8.listRgbInt8ToRgbInt8;

  List<int> get intColorToListRgbInt8 => [$2, $3, $4];
}

extension ColorNameIntColorShortExt on IntColorShort {
  /// See [ColorNameUniColorExt.withoutModel].
  IntColor withModel(ColorModel model) => (model, $1, $2, $3);
}

extension ColorNameListIntExt on List<int> {
  int get listRgbInt8ToRgbInt8 =>
      (((this[0] & 0xff) << 16) |
          ((this[1] & 0xff) << 8) |
          ((this[2] & 0xff) << 0)) &
      0xFFFFFF;
}

extension ColorNameIntExt on int {
  String get intToRgbInt8String => toRadixString(16).padLeft(8, '0');
}
