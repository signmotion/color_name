import 'package:uni_color_name/uni_color_name.dart';
import 'package:test/test.dart';

void main() {
  const m = ColorModel.rgb;

  group('ColorNameUniColorIntExt', () {
    test('colorArgbToInt8Argb', () {
      expect((m, 0, 0, 0, 0).colorArgbToInt8Argb, 0x00000000);
      expect((m, 0xaa, 0, 0, 0).colorArgbToInt8Argb, 0xaa000000);
      expect((m, 0xff, 0xff, 0xff, 0xff).colorArgbToInt8Argb, 0xffffffff);
    });
  });
}
