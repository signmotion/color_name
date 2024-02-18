part of '../uni_color_name.dart';

/// The [ColorModel] includes only color representation.
/// See [UniColor] for structure a color.
enum ColorModel {
  unspecified(),

  cmyk(),

  /// R, G, B as double.
  /// Range [0.0; 1.0] per channel.
  rgb(),

  /// H, S, L as double.
  /// Range [0.0; 1.0] per channel.
  hsl(),

  /// H, S, V as double.
  /// Range [0.0; 1.0] per channel.
  hsv(),

  /// X, Y, Z as double.
  /// See https://en.wikipedia.org/wiki/CIE_1931_color_space
  xyz();

  const ColorModel();

  @override
  String toString() => name;
}
