part of '../uni_color_name.dart';

/// TODO(sign): Range checker for each model.
enum ColorModel {
  unspecified(),

  cmyk(),

  /// R, G, B as double.
  /// Range [0.0; 1.0] per channel.
  rgb(),

  /// R, G, B as int.
  /// Range [0; 255] per channel.
  rgbInt8(),

  /// R, G, B as 24 bits hexdecimal string.
  rgbInt8String(),

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
