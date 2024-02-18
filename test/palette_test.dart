import 'package:uni_color_name/uni_color_name.dart';
import 'package:test/test.dart';

void main() {
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
