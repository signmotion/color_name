part of '../../../color_name.dart';

extension ColorNameStringExt on String {
  /// The string with latin characters only.
  String get normalizedNameColor =>
      replaceAll(RegExp(r'[\W]+'), '').toLowerCase();
}
