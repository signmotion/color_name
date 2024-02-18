part of '../uni_color_name.dart';

/// The universal value for color as a record of [T] values.
/// The values can represent any [ColorModel].
typedef UniColor<T> = (ColorModel, T, T, T);
typedef UniColorShort<T> = (T, T, T);

/// Represents a color as double value.
//typedef UniColorDouble = UniColor<double>;

/// Represents a color as int value.
//typedef UniColorInt = UniColor<int>;

/// Represents a color as hexadecimal string value.
//typedef UniColorString = UniColor<String>;
