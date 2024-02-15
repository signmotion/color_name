part of '../uni_color_name.dart';

enum ColorModel {
  unspecified,
  cmyk,

  /// RRGGBB as int, 24 bits
  rgb,

  /// "#RRGGBB"
  rgbHexStr,

  hsl,
  hsv,
  xyz,
}
