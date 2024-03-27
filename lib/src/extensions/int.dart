part of '../../uni_color_name.dart';

extension ColorNameInt8Ext on int {
  ArgbInt8Color get argbInt8Color => ArgbInt8Color(
        channel0: int8Channel0Color,
        channel1: int8Channel1Color,
        channel2: int8Channel2Color,
        channel3: int8Channel3Color,
      );

  RgbInt8Color get rgbInt8Color => RgbInt8Color.rgb(
        int8Channel1Color,
        int8Channel2Color,
        int8Channel3Color,
      );

  /// The zero (alpha in ARGB model) channel of this color in an 8 bit value.
  int get int8Channel0Color => (0xff000000 & this) >> 24;

  /// The first (red in ARGB model) channel of this color in an 8 bit value.
  int get int8Channel1Color => (0x00ff0000 & this) >> 16;

  /// The second (green in ARGB model) channel of this color in an 8 bit value.
  int get int8Channel2Color => (0x0000ff00 & this) >> 8;

  /// The third (blue in ARGB model) channel of this color in an 8 bit value.
  int get int8Channel3Color => (0x000000ff & this) >> 0;

  int get argbToRgbInt8Color => this & 0xffffff;

  String get argbToArgbStringHexInt8Color => toRadixString(16).padLeft(8, '0');

  String get argbToRgbStringHexInt8Color =>
      argbToRgbInt8Color.toRadixString(16).padLeft(6, '0');

  /// For example, RGB.
  String get int8Channels123HexColor => toRadixString(16).padLeft(6, '0');

  /// For example, ARGB.
  String get int8Channels0123HexColor => toRadixString(16).padLeft(8, '0');

  String get int8Channel0HexColor => toRadixString(16).padLeft(2, '0');
  String get int8Channel1HexColor => toRadixString(16).padLeft(2, '0');
  String get int8Channel2HexColor => toRadixString(16).padLeft(2, '0');
  String get int8Channel3HexColor => toRadixString(16).padLeft(2, '0');
}