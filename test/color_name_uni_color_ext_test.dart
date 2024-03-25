import 'package:uni_color_name/uni_color_name.dart';
import 'package:test/test.dart';

void main() {
  const m = ColorModel.argb;

  group('ColorNameUniColorExt', () {
    test('withoutModel', () {
      expect((m, 255, 11, 33, 66).noModel, (255, 11, 33, 66));
    });

    test('colorToList', () {
      expect((m, 255, 11, 33, 66).colorToList, [255, 11, 33, 66]);
    });
  });
}
