# Changelog

All notable changes to the project `UniColorName` will be documented in this file.
See [Conventional Commits](https://conventionalcommits.org) for commit guidelines.

## 0.6.0

- Split into 3 projects:
  - this
  - [UniColorModel](https://pub.dev/packages/uni_color_model)
  - [UniColorPalette](https://pub.dev/packages/uni_color_palette)

## 0.5.0

- Expanded `UniColor` with alpha channel. Updated palettes.
- Included a Flutter example with palette Zeplin.
- Renamed `ColorModel.rgb` to `ColorModel.argb`.
- Introduced `UniColorNoAlpha` and `UniColorShortNoAlpha` classes.
- Renamed `withoutModel` to `noModel`.
- Renamed `i256` to `index256` and optimized it.
- Added `withAlpha` and `noAlpha` extensions.
- Renamed a test palettes.
- Improved Welcome and TODO sections in `README`.
- Provided a platform support in `README`.

## 0.4.1

- Fixed CI.

## 0.4.0

- Provided `Palette.operator[](String colorName)`.
- Some color conversion extensions have been renamed.
- Added a Flutter example with visualize palette `Zeplin`.
- Enhanced `README`.
- Added some TODOs.
- Added CI.

## 0.3.0

- Generalized `UniColor` and `Palette`.
- Closest color with various color distance formulas.
- Introduced converters to `UniPalette`. WIP.
- Introduced the factory `UniPalette.list()`.
- Introduced `UniColor<int>.i256`: returns a 1-dimension index for the channel range [0; 255].
- Stabilized `UniPalette.file()`.
- Updated `README`.

## 0.2.0

- Extended `ColorModel` and `Palette`.
- Introduced extensions for `UniColor` and `IntUniColor`.
- Updated `README`.

## 0.1.0

- Initial release.
