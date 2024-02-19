import 'package:uni_color_name/uni_color_name.dart';
import 'package:test/test.dart';

void main() {
  group('Palette - load from file', () {
    test('absent file', () {
      expect(
          () => UniPalette<int>.file(
                'test/data/palettes/absent_file.json',
                ColorModel.rgb,
              ),
          throwsA(isA<ArgumentError>()));
    });

    test('empty', () {
      expect(
          () => UniPalette<int>.file(
                'test/data/palettes/empty.json',
                ColorModel.rgb,
              ),
          throwsA(isA<ArgumentError>()));
    });

    test('1 color', () {
      expect(
          () => UniPalette<int>.file(
                'test/data/palettes/1_color.json',
                ColorModel.rgb,
              ),
          throwsA(isA<ArgumentError>()));
    });

    test('2 colors', () {
      final palette = UniPalette<int>.file(
        'test/data/palettes/black_white.json',
        ColorModel.rgb,
      );
      expect(palette.count, 2);
      expect(palette.map.keys.first, '000000');
      expect(palette.map.values.first, (ColorModel.rgb, 0, 0, 0));
      expect(palette.map.keys.last, 'ffffff');
      expect(palette.map.values.last, (ColorModel.rgb, 255, 255, 255));
    });

    test('grey_0_256', () {
      final palette = UniPalette<int>.file(
        'test/data/palettes/grey_0_256.json',
        ColorModel.rgb,
      );
      expect(palette.count, 256);
    });
  });

  group('Palette - closest color', () {
    test('2 colors', () {
      final palette = UniPalette<int>.file(
        'test/data/palettes/black_white.json',
        ColorModel.rgb,
      );
      const cd = RgbColorSqrtDistance<int>();

      String closest(int color) =>
          palette.closest(color.colorRgbToUniColorRgb<int>(), cd).$1;

      expect(closest(0x000000), '000000');
      expect(closest(0x00000 + 1), '000000');
      expect(closest(0x7f7f7f - 1), '000000');
      expect(closest(0x7f7f7f), '000000');
      expect(closest(0x7f7f7f + 1), '000000');
      expect(closest(0x7f7f7f + 2), 'ffffff');
      expect(closest(0xffffff - 1), 'ffffff');
      expect(closest(0xffffff), 'ffffff');
    });

    test('256 colors', () {
      final palette = UniPalette<int>.file(
        'test/data/palettes/grey_0_256.json',
        ColorModel.rgb,
      );
      const cd = RgbColorSqrtDistance<int>();

      String closest(int color) =>
          palette.closest(color.colorRgbToUniColorRgb<int>(), cd).$1;

      expect(closest(0x000000), '000000');
      expect(closest(0x00000 + 1), '000000');
      expect(closest(0x00000 + 2), '010101');
      expect(closest(0x7f7f7f - 1), '7f7f7f');
      expect(closest(0x7f7f7f), '7f7f7f');
      expect(closest(0x7f7f7f + 1), '7f7f7f');
      expect(closest(0x7f7f7f + 2), '808080');
      expect(closest(0xffffff - 2), 'fefefe');
      expect(closest(0xffffff - 1), 'ffffff');
      expect(closest(0xffffff), 'ffffff');
    });
  });
}
