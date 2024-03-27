part of '../uni_color_name.dart';

/// The presentation of [C] channel.
enum ColorChannelPresentation {
  unspecified(),

  decimal(),
  hex(),
  percentage();

  const ColorChannelPresentation();

  @override
  String toString() => name;
}
