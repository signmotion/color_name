part of '../uni_color_name.dart';

/// Calculate distance between colors.
/// Thanks "[Using Different Color Spaces to Compare Colors](https://dev.to/bytebodger/using-different-color-spaces-to-compare-colors-5agg)" for research.
abstract class ColorDistance<T extends Object> {
  const ColorDistance();

  /// A distance between colors [a] and [b].
  /// See descendants of this class.
  double distance(UniColor<T> a, UniColor<T> b);
}

class RgbColorSqrtDistance<T extends Object> extends ColorDistance<T> {
  const RgbColorSqrtDistance();

  @override
  double distance(UniColor<T> a, UniColor<T> b) =>
      sqrt(RgbColorSquareDistance<T>().distance(a, b));
}

class RgbColorSquareDistance<T extends Object> extends ColorDistance<T> {
  const RgbColorSquareDistance();

  @override
  double distance(UniColor<T> a, UniColor<T> b) => switch ((a, b)) {
        (UniColor<num> a, UniColor<num> b) =>
          a.subtract(b).square.summarize.toDouble(),
        _ => throw ArgumentError('The `a` and `b` should be `num`.'
            ' We have: a `${a.runtimeType}`, b `${b.runtimeType}`.'),
      };
}
