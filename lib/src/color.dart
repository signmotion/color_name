part of '../uni_color_name.dart';

/// The universal value for color as a record of double values.
/// See [IntColor], [ColorModel].
/// `Uni` means `double`.
typedef UniColor = (ColorModel, double, double, double);
typedef UniColorShort = (double, double, double);

/// The universal value for color as a record of integer values.
/// See [UniColor], [ColorModel].
/// `Uni` means `double` therefore `Int` replaces `Uni`.
typedef IntColor = (ColorModel, int, int, int);
typedef IntColorShort = (int, int, int);

/// The color with RGB channels as Dart [int] value.
//typedef rgbInt8Color = int; - Don't hide the types. [int] is enough.
