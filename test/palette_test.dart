import 'package:uni_color_name/uni_color_name.dart';
import 'package:test/test.dart';

void main() {
  group('Palette - load from file', () {
    test('absent file', () {
      expect(
          () => UniPalette.file(
                'test/data/palettes/absent_file.json',
                ColorModel.rgb,
              ),
          throwsA(isA<ArgumentError>()));
    });

    test('empty', () {
      expect(
          () => UniPalette.file(
                'test/data/palettes/empty.json',
                ColorModel.rgb,
              ),
          throwsA(isA<ArgumentError>()));
    });

    test('1 color', () {
      expect(
          () => UniPalette.file(
                'test/data/palettes/1_color.json',
                ColorModel.rgb,
              ),
          throwsA(isA<ArgumentError>()));
    });

    test('2 colors', () {
      final palette = UniPalette.file(
        'test/data/palettes/black_white.json',
        ColorModel.rgb,
      );
      expect(palette.count, 2);
      expect(palette.list.first.rgbInt8Color.int24Hex, '000000');
      expect(palette.list.last.rgbInt8Color.int24Hex, 'ffffff');
    });

    test('grey_0_255', () {
      final palette = UniPalette.file(
        'test/data/palettes/grey_0_255.json',
        ColorModel.rgb,
      );
      expect(palette.count, 256);
    });
  });

  group('Palette - closest color', () {
    test('2 colors', () {
      final palette = UniPalette.file(
        'test/data/palettes/black_white.json',
        ColorModel.rgb,
      );
      final u = UniColorName(palette);

      const cd = RgbColorSqrtDistance();

      String closest(int color) =>
          u.closest(color.rgbInt8Color, cd).rgbInt8Color.int24Hex;

      expect(closest(0xff000000), '000000');
      expect(closest(0x00000 + 1), '000000');
      expect(closest(0x7f7f7f - 1), '000000');
      expect(closest(0x7f7f7f), '000000');
      expect(closest(0x7f7f7f + 1), '000000');
      expect(closest(0x7f7f7f + 2), 'ffffff');
      expect(closest(0xffffff - 1), 'ffffff');
      expect(closest(0xffffff), 'ffffff');
    });

    test('256 colors', () {
      final palette = UniPalette.file(
        'test/data/palettes/grey_0_255.json',
        ColorModel.rgb,
      );
      final u = UniColorName(palette);

      const cd = RgbColorSqrtDistance();

      String closest(int color) =>
          u.closest(color.rgbInt8Color, cd).rgbInt8Color.int24Hex;

      expect(closest(0x000000), '000000');
      expect(closest(0x000000 + 1), '000000');
      expect(closest(0x000000 + 2), '010101');
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
