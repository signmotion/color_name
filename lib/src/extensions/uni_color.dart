part of '../../../color_name.dart';

extension ColorNameUniColorExt on UniColor {
  UniColor roundToDecimalPlaces(int decimals) => decimals < 0
      ? this
      : (
          $1.roundToDecimalPlaces(decimals),
          $2.roundToDecimalPlaces(decimals),
          $3.roundToDecimalPlaces(decimals)
        );
}
