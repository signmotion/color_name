// ignore_for_file: avoid_print

import 'package:uni_color_name/uni_color_name.dart';

/// See also `example/all_palettes` forlder with Flutter SDK example
/// that visualize a palette.
void main() {
  final u = UniColorName(zeplinPalette);
  print(u.value('forrest green'));
  print(u.name(RgbInt8Color.rgb(0x15, 0x44, 0x06)));
}
