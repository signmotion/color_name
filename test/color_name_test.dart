import 'package:test/test.dart';
import 'package:uni_color_name/uni_color_name.dart';

void main() {
  group('UniColorName', () {
    final u = UniColorName(zeplinPalette);
    const colorName = 'forrest green';
    final colorValue = RgbInt8Color.rgb(0x15, 0x44, 0x06);

    test('detecting a value by name, exact match', () {
      expect(u.value(colorName)?.rgbInt8Color.int24Hex, colorValue.int24Hex);
    });

    test('detecting a name by value, exact match', () {
      expect(u.name(colorValue), colorName);
    });
  });
}
