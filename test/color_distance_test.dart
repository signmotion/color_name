import 'package:test/test.dart';
import 'package:uni_color_name/uni_color_name.dart';

void main() {
  group('ColorDistance', () {
    test('RgbColorSqrtDistance', () {
      const cd = RgbColorSqrtDistance();

      final a = 0x000000.rgbInt8Color;
      final b = 0xffffff.rgbInt8Color;
      expect(cd.distance(a, b).roundToDecimals(2), 441.67);

      {
        final c = 0x010203.rgbInt8Color;
        expect(cd.distance(a, c).roundToDecimals(2), 3.74);
      }

      {
        final c = 0xf1f2f3.rgbInt8Color;
        expect(cd.distance(b, c).roundToDecimals(2), 22.56);
      }
    });
  });
}
