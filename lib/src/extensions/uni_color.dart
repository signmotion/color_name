part of '../../uni_color_name.dart';

/// ! All extensions processing a color like
extension ColorNameUniColorExt on UniColor {
  /// Round to integers.
  /// Alias [colorToIntColor].
  IntUniColor get colorToRound => (
        $1.roundToDecimals(0).round(),
        $2.roundToDecimals(0).round(),
        $3.roundToDecimals(0).round()
      );

  /// Alias [colorToRound].
  IntUniColor get colorToIntColor => colorToRound;

  /// Round by defined decimal places.
  UniColor colorToRoundDecimals(int decimals) => decimals < 0
      ? this
      : (
          $1.roundToDecimals(decimals),
          $2.roundToDecimals(decimals),
          $3.roundToDecimals(decimals)
        );

  IntUniColor colorToScaledIntColor(int k) =>
      ($1 * k, $2 * k, $3 * k).colorToRound;

  int get colorToRgb8Int => colorToScaledIntColor(255).intColorToRgb8Int;

  List<int> get colorToListRgb8Int => [
        ($1 * 255).round(),
        ($2 * 255).round(),
        ($3 * 255).round(),
      ];
}

extension ColorNameIntUniColorExt on IntUniColor {
  /// Convert to doubles.
  UniColor get intColorToColor => ($1.toDouble(), $2.toDouble(), $3.toDouble());

  UniColor scaleToDoubleColor(double k, [int decimals = 0]) =>
      ($1 / k, $2 / k, $3 / k).colorToRoundDecimals(decimals);

  int get intColorToRgb8Int => intColorToListRgb8Int.listRgb8IntToRgb8Int;

  List<int> get intColorToListRgb8Int => [$1, $2, $3];
}

extension ColorNameListIntExt on List<int> {
  int get listRgb8IntToRgb8Int =>
      (((this[0] & 0xff) << 16) |
          ((this[1] & 0xff) << 8) |
          ((this[2] & 0xff) << 0)) &
      0xFFFFFF;
}

extension ColorNameIntExt on int {
  String get intToRgbString => toRadixString(16).padLeft(8, '0');
}
