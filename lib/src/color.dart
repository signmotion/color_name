part of '../uni_color_name.dart';

/// The universal value for color as a record of [T] values.
/// The values can represent any [ColorModel] with opacity.
typedef UniColor<T> = (ColorModel, T, T, T, T);

/// Same [UniColor] but without a [ColorModel].
typedef UniColorShort<T> = (T, T, T, T);

/// Same [UniColor] but without a first (alpha) value.
typedef UniColorNoAlpha<T> = (ColorModel, T, T, T);

/// Same [UniColorShort] but without a first (alpha) value.
typedef UniColorShortNoAlpha<T> = (T, T, T);

/// Represents a color as double value.
//typedef UniColorDouble = UniColor<double>;

/// Represents a color as int value.
//typedef UniColorInt = UniColor<int>;

/// Represents a color as hexadecimal string value.
//typedef UniColorString = UniColor<String>;
