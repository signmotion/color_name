import 'package:test/test.dart';
import 'package:uni_color_name/uni_color_name.dart';

void main() {
  group('ColorDistance', () {
    test('RgbColorSqrtDistance', () {
      const cd = RgbColorSqrtDistance<int>();

      final a = 0x00000000.colorArgbToUniColorArgb<int>();
      final b = 0xffffffff.colorArgbToUniColorArgb<int>();
      expect(cd.distance(a, b).roundToDecimals(2), 510.0);

      {
        final c = 0xff010203.colorArgbToUniColorArgb<int>();
        expect(cd.distance(a, c).roundToDecimals(2), 255.03);
      }

      {
        final c = 0xfff1f2f3.colorArgbToUniColorArgb<int>();
        expect(cd.distance(b, c).roundToDecimals(2), 22.56);
      }
    });
  });
}
