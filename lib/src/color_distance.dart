part of '../uni_color_name.dart';

/// Calculate distance between colors.
/// [T] is a type for [UniColor].
/// Thanks "[Using Different Color Spaces to Compare Colors](https://dev.to/bytebodger/using-different-color-spaces-to-compare-colors-5agg)" for research.
abstract class ColorDistance<T extends num> {
  const ColorDistance();

  /// A distance between colors [a] and [b].
  /// See descendants of this class.
  double distance(NumColor<T> a, NumColor<T> b);
}

class RgbColorSqrtDistance<T extends num> extends ColorDistance<T> {
  const RgbColorSqrtDistance();

  @override
  double distance(NumColor<T> a, NumColor<T> b) =>
      sqrt(RgbColorSquareDistance<T>().distance(a, b));
}

class RgbColorSquareDistance<T extends num> extends ColorDistance<T> {
  const RgbColorSquareDistance();

  @override
  double distance(NumColor<T> a, NumColor<T> b) =>
      (a - b).square.summarize.toDouble();
}
