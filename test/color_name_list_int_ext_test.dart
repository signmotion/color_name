import 'package:uni_color_name/uni_color_name.dart';
import 'package:test/test.dart';

void main() {
  const m = ColorModel.argb;

  group('ColorNameListIntExt', () {
    test('color channels', () {
      const c = 0xFFA1B2C3;
      expect(c.colorChannel1, 0xFF);
      expect(c.colorChannel2, 0xA1);
      expect(c.colorChannel3, 0xB2);
      expect(c.colorChannel4, 0xC3);
    });

    test('colorArgbToUniColorArgb', () {
      const c = 0xffa1b2c3;
      expect(c.colorArgbToUniColorArgb<int>(), (m, 0xff, 0xa1, 0xb2, 0xc3));
    });

    test('colorArgbToUniColorShort', () {
      const c = 0xffa1b2c3;
      expect(c.colorArgbToUniColorShort<int>(), (0xff, 0xa1, 0xb2, 0xc3));
    });
  });
}
