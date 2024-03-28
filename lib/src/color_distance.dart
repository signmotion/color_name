part of '../uni_color_name.dart';

/// Calculate distance between colors.
/// Thanks "[Using Different Color Spaces to Compare Colors](https://dev.to/bytebodger/using-different-color-spaces-to-compare-colors-5agg)" for research.
abstract class ColorDistance<T extends UniColor> {
  const ColorDistance();

  /// A distance between colors [a] and [b].
  /// See descendants of this class.
  double distance(T a, T b);
}

class RgbColorSqrtDistance<T extends UniColor> extends ColorDistance<T> {
  const RgbColorSqrtDistance();

  @override
  double distance(T a, T b) => sqrt(RgbColorSquareDistance<T>().distance(a, b));
}

class RgbColorSquareDistance<T extends UniColor> extends ColorDistance<T> {
  const RgbColorSquareDistance();

  @override
  double distance(T a, T b) => (a - b).square.summarize.toDouble();
}
