import 'package:uni_color_name/uni_color_name.dart';
import 'package:test/test.dart';

void main() {
  group('Palette - load from file', () {
    test('grey_0_256', () {
      final palette = UniPalette<int>.file(
        'test/data/palettes/grey_0_256.json',
        ColorModel.rgb,
      );
      expect(palette.count, 256);
    });
  });
}
