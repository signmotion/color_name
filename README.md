# Color Name

![Cover - Color Name](https://raw.githubusercontent.com/signmotion/color_name/master/images/cover.webp)

[![GitHub License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/signmotion/color_name/master/LICENSE)

Identifies the value of a color by name and vice versa. Knows over 900 color names.
The easy-to-use and well-tested library.

## Usage

```dart
const c = UniColorName();
print(c.value('forrest green'));
print(c.name((0.08, 0.27, 0.02), decimals: 2));
```

Output:

```text
(0.0823529411764706, 0.266666666666667, 0.0235294117647059)
forrest green
```

## Color Palettes

You can add your own color palette: the class `ColorName` can work with any palette inherited from `Palette<T>`.

## Welcome

This package is open-source, stable and well-tested. Development happens on
[GitHub](https://github.com/signmotion/color_name). Feel free to report issues
or create a pull-request there.

General questions are best asked on
[StackOverflow](https://stackoverflow.com/questions/tagged/color_name).

## TODO

- Feautures for this package into README.
- Converters between models.
- Converters between palettes.
- How to define your own map for color palette.
- Optimize a search.
- Fuzzy search by name.
- Fuzzy search by value.
- More palettes. See <https://en.wikipedia.org/wiki/List_of_colors:_A%E2%80%93F>
