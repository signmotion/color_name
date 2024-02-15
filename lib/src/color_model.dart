part of '../uni_color_name.dart';

enum ColorModel {
  unspecified,

  cmyk,

  /// RRGGBB as double, range [0.0; 1.0] per channel
  rgb,

  /// RRGGBB as int, range [0; 255] per channel
  rgbInt8,

  /// RRGGBB as hexdecimal string with prefix `#`
  rgbString,

  hsl,

  hsv,

  xyz,
}
