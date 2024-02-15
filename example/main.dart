// ignore_for_file: avoid_print

import 'package:uni_color_name/uni_color_name.dart';

void main() {
  const c = UniColorName();
  print(c.value('forrest green'));
  print(c.name((0.08, 0.27, 0.02), decimalPlaces: 2));
}
