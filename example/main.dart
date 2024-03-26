// ignore_for_file: avoid_print

import 'package:uni_color_name/uni_color_name.dart';

/// See also `example/all_palettes` forlder with Flutter example
/// that visualize a palette.
void main() {
  final palette = UniPalette(PalettesMaps.zeplin);
  final c = UniColorName(palette);
  print(c.value('forrest green'));
  print(c.name((0.08, 0.27, 0.02), decimals: 2));
}
