import 'package:uni_color_name/uni_color_name.dart';
import 'package:test/test.dart';

void main() {
  group('Palette - load from file', () {
    test('absent file', () {
      expect(
          () => UniPalette<int>.file(
                'test/data/palettes/absent_file.json',
                ColorModel.argb,
              ),
          throwsA(isA<ArgumentError>()));
    });

    test('empty', () {
      expect(
          () => UniPalette<int>.file(
                'test/data/palettes/empty.json',
                ColorModel.argb,
              ),
          throwsA(isA<ArgumentError>()));
    });

    test('1 color', () {
      expect(
          () => UniPalette<int>.file(
                'test/data/palettes/1_color.json',
                ColorModel.argb,
              ),
          throwsA(isA<ArgumentError>()));
    });

    test('2 colors', () {
      final palette = UniPalette<int>.file(
        'test/data/palettes/black_white.json',
        ColorModel.argb,
      );
      expect(palette.count, 2);
      expect(palette.map.keys.first, 'ff000000');
      expect(palette.map.values.first, (ColorModel.argb, 255, 0, 0, 0));
      expect(palette.map.keys.last, 'ffffffff');
      expect(palette.map.values.last, (ColorModel.argb, 255, 255, 255, 255));
    });

    test('grey_0_255', () {
      final palette = UniPalette<int>.file(
        'test/data/palettes/grey_0_255.json',
        ColorModel.argb,
      );
      expect(palette.count, 256);
    });
  });

  group('Palette - closest color', () {
    test('2 colors', () {
      final palette = UniPalette<int>.file(
        'test/data/palettes/black_white.json',
        ColorModel.argb,
      );
      const cd = RgbColorSqrtDistance<int>();

      String closest(int color) =>
          palette.closest(color.colorArgbToUniColorArgb<int>(), cd).$1;

      expect(closest(0xff000000), 'ff000000');
      expect(closest(0xff00000 + 1), 'ff000000');
      expect(closest(0xff7f7f7f - 1), 'ff000000');
      expect(closest(0xff7f7f7f), 'ff000000');
      expect(closest(0xff7f7f7f + 1), 'ff000000');
      expect(closest(0xff7f7f7f + 2), 'ffffffff');
      expect(closest(0xffffffff - 1), 'ffffffff');
      expect(closest(0xffffffff), 'ffffffff');
    });

    test('256 colors', () {
      final palette = UniPalette<int>.file(
        'test/data/palettes/grey_0_255.json',
        ColorModel.argb,
      );
      const cd = RgbColorSqrtDistance<int>();

      String closest(int color) =>
          palette.closest(color.colorArgbToUniColorArgb<int>(), cd).$1;

      expect(closest(0xff000000), 'ff000000');
      expect(closest(0xff000000 + 1), 'ff000000');
      expect(closest(0xff000000 + 2), 'ff010101');
      expect(closest(0xff7f7f7f - 1), 'ff7f7f7f');
      expect(closest(0xff7f7f7f), 'ff7f7f7f');
      expect(closest(0xff7f7f7f + 1), 'ff7f7f7f');
      expect(closest(0xff7f7f7f + 2), 'ff808080');
      expect(closest(0xffffffff - 2), 'fffefefe');
      expect(closest(0xffffffff - 1), 'ffffffff');
      expect(closest(0xffffffff), 'ffffffff');
    });
  });
}
