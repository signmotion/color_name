part of '../../../color_name.dart';

extension ColorNameDoubleExt on double {
  static const defaultZeroValue = 0.0001;

  bool get isNearZero => isNear(0.0);

  bool get isNearHalf => isNear(0.5);

  bool get isNearOne => isNear(1.0);

  bool isNear(double v, [double zeroValue = defaultZeroValue]) =>
      (this - v).abs() < zeroValue;

  double roundToDecimalPlaces(int decimals) {
    if (decimals < 0) {
      return this;
    }

    if (decimals == 0) {
      return roundToDouble();
    }

    final p = pow(10, decimals);

    return (this * p).roundToDouble() / p;
  }
}
