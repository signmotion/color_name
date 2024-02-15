import 'package:color_name/color_name.dart';
import 'package:test/test.dart';

void main() {
  group('ColorName', () {
    const c = UniColorName();
    const forrestGreenName = 'forrest green';
    const forrestGreenValue =
        (0.0823529411764706, 0.266666666666667, 0.0235294117647059);

    test('detecting a value by name, exact match', () {
      expect(c.value(forrestGreenName), forrestGreenValue);
    });

    test('detecting a name by value, exact match', () {
      expect(c.name(forrestGreenValue), forrestGreenName);
    });
  });
}
