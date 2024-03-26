import 'package:flutter/material.dart';
import 'package:uni_color_name/uni_color_name.dart';

/// See also `example/main.dart` file with pure Dart SDK example.
void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  /// You can choose any palette from [PalettesMaps].
  UniPalette<double> get palette => UniPalette(PalettesMaps.commodore64);

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text('UniColorName Palettes'),
            ),
          ),
          body: SingleChildScrollView(
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [note, ...glasses],
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
      );

  Widget get note => Text(
        'The palette contains ${palette.count} colors',
        textScaler: const TextScaler.linear(1.5),
      );

  List<Widget> get glasses => [
        for (final name in palette.map.keys.toList()..sort())
          Glass(
            name: name,
            value: palette[name]?.colorArgbToInt8Argb ?? 0,
          ),
      ];
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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: color,
              offset: const Offset(0, 2),
              blurRadius: 1,
            )
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, color],
          ),
        ),
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
