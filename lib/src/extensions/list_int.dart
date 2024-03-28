part of '../../uni_color_name.dart';

extension ColorNameListIntExt on List<int> {
  /// One channel has 8 bits.
  int get argbInt8ToArgbInt8Color =>
      ((0xff & this[0]) << 24 |
          (0xff & this[1]) << 16 |
          (0xff & this[2]) << 8 |
          (0xff & this[3]) << 0) &
      0xFFFFFFFF;

  /// Remove alpha.
  /// One channel has 8 bits.
  int get argbInt8ToRgbInt8Color =>
      ((0xff & this[1]) << 16 | (0xff & this[2]) << 8 | (0xff & this[3]) << 0) &
      0xFFFFFF;
}
