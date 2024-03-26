import 'package:flutter/material.dart';
import 'package:uni_color_name/uni_color_name.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('UniColorName Palettes')),
          body: SingleChildScrollView(
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                Text(
                  'The palette Zeplin contains ${palette.count} colors',
                  textScaler: const TextScaler.linear(1.5),
                ),
                for (final name in palette.map.keys.toList()..sort())
                  Glass(
                    name: name,
                    value: palette[name]?.colorArgbToInt8Argb ?? 0,
                  ),
              ],
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
      );

  UniPalette<double> get palette => UniPalette(PalettesMaps.zeplin);
}

class Glass extends StatelessWidget {
  const Glass({
    super.key,
    required this.name,
    required this.value,
  });

  final String name;
  final int value;

  String get code => '#${value.colorArgbToStringRgb}';

  @override
  Widget build(BuildContext context) {
    final color = Color(value).withOpacity(1.0);

    final size = MediaQuery.of(context).size;
    final height = size.height / 12;

    return Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
        color: color,
        height: height,
        alignment: Alignment.centerLeft,
        child: Text(
          '$code $name',
          textScaler: const TextScaler.linear(2),
        ),
      ),
    );
  }
}
