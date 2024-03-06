# Uni(fying) Color Name

![Cover - Unifying Color Name](https://raw.githubusercontent.com/signmotion/uni_color_name/master/images/cover.webp)

[![GitHub License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/signmotion/uni_color_name/master/LICENSE)

Identifies the value of a color by name and vice versa. Knows over 900 color names.
The easy-to-use and well-tested library.
Feel free to use it in your projects.

## Usage

```dart
final palette = UniPalette(PalettesMaps.zeplin);
final c = UniColorName(palette);
print(c.value('forrest green'));
print(c.name((0.08, 0.27, 0.02), decimals: 2));
```

Output:

```text
(rgb, 0.0823529411764706, 0.266666666666667, 0.0235294117647059)
forrest green
```

## Colors

<details>
  <summary>A list of colors that can be identified right now:</summary>

black, very dark blue, dark navy blue, dark blue, dark navy, navy blue, dark forest green, prussian blue, dark blue green, deep teal, petrol, kelley green, greenish turquoise, cyan, true blue, navy, marine blue, darkish blue, racing green, dark teal, deep sea blue, bright blue, peacock blue, dark aquamarine, deep turquoise, bluegreen, ocean, teal blue, irish green, emerald, shamrock, green/blue, bright teal, bright green, midnight blue, pure blue, dark royal blue, rich blue, deep green, emerald green, teal, kelly green, shamrock green, bright sky blue, aqua blue, midnight, darkblue, cobalt blue, dark green, vibrant blue, blue, ocean blue, deep blue, night blue, marine, bottle green, dark turquoise, sea blue, jungle green, cerulean, aquamarine, neon blue, turquoise green, royal blue, evergreen, british racing green, darkgreen, dark aqua, cerulean blue, bright sea green, very dark green, forest green, electric blue, azure, turquoise blue, green blue, turquoise, almost black, primary blue, deep aqua, true green, fluorescent green, twilight blue, pine green, spruce, dark cyan, vibrant green, fluro green, hunter green, forest, greenish blue, minty green, bright aqua, strong blue, royal, green teal, tealish green, neon green, deep sky blue, water blue, blue/green, bright turquoise, nice blue, bluish green, dark sea green, aqua green, blue green, topaz, aqua, vivid blue, forrest green, light navy, green, ultramarine blue, seaweed, dark, highlighter green, very dark brown, azul, cobalt, viridian, spearmint, dark indigo, dark blue grey, dark green blue, jade, dark seafoam, ultramarine, dark mint green, wintergreen, sapphire, dark slate blue, algae green, electric green, blue blue, greenblue, clear blue, tealish, teal green, hot green, dusk blue, bright light blue, mid blue, midnight purple, darkish green, dark grey blue, bluish, very dark purple, tree green, greenish cyan, pine, jade green, bluey green, medium blue, radioactive green, bright light green, light navy blue, aqua marine, vivid green, ugly blue, greenish teal, cool green, dark violet, dark brown, charcoal, dark purple, navy green, seaweed green, deep purple, dark grey, dark olive, windows blue, indigo, eggplant, dark grass green, medium green, indigo blue, light royal blue, weird green, denim blue, denim, muted blue, dark maroon, charcoal grey, dark olive green, flat blue, sea, aubergine, chocolate, lightish blue, ocean green, dodger blue, dark seafoam green, dark plum, dirty blue, grass green, greenish, poison green, deep brown, chocolate brown, grassy green, bright cyan, greeny blue, eggplant purple, french blue, dark sky blue, blueberry, dusky blue, dark mint, deep violet, dull blue, cool blue, mahogany, royal purple, dried blood, warm blue, army green, camouflage green, dusty teal, lawn green, plum purple, twilight, dusk, cadet blue, light neon green, metallic blue, light forest green, stormy blue, mid green, violet blue, slate, cornflower blue, leafy green, camo green, blue with a hint of purple, gunmetal, sea green, light bright green, green brown, fern green, algae, blurple, off blue, dark pastel green, light green blue, blue purple, plum, frog green, slate grey, dark sage, blue/purple, steel blue, dusty blue, slate blue, sap green, leaf green, grass, kermit green, blue violet, grape purple, purple/blue, greyish blue, grey teal, green apple, purpley blue, dull teal, muted green, purplish blue, mud brown, mud green, blue grey, burgundy, purpleish blue, toxic green, lightish green, bluey purple, iris, purple blue, mossy green, fern, boring green, light greenish blue, olive brown, grey/blue, soft blue, maroon, brown, muddy green, moss green, faded blue, slate green, tea, bright lime green, purply blue, dark periwinkle, military green, dirty green, purple brown, olive green, claret, burple, greeny brown, greenish brown, swamp, flat green, fresh green, brownish green, cornflower, purplish brown, battleship grey, grey blue, off green, grape, murky green, light indigo, robin's egg, reddy brown, olive, apple, browny green, olive drab, poop green, steel grey, soft green, bluish purple, brown green, nasty green, greyish teal, leaf, rich purple, khaki green, dark yellow green, merlot, dirty purple, mud, steel, chestnut, swamp green, bluish grey, drab green, dull green, velvet, darkish purple, shit green, blue/grey, turtle green, sky blue, lighter green, brownish purple, moss, dusty green, apple green, light bluish green, lightgreen, blood, green grey, greyblue, asparagus, grey green, seafoam blue, poop brown, purplish grey, greyish brown, ugly green, seafoam green, bordeaux, wine red, shit brown, faded green, lightblue, tiffany blue, light aquamarine, ugly brown, medium grey, purple, bruise, greeny grey, dark lime green, light turquoise, light blue green, reddish brown, milk chocolate, medium brown, poop, shit, dark taupe, grey brown, camo, wine, muted purple, seafoam, red purple, dusty purple, grey purple, drab, greyish green, sky, pale teal, dirt brown, dark red, dull purple, dark lime, indian red, dark lavender, bluegrey, purple grey, brownish grey, grey/green, dark mauve, purpley, cocoa, dull brown, avocado green, sage, bright lime, poo brown, muddy brown, greyish purple, baby shit green, sage green, light eggplant, dusky purple, bluey grey, vomit green, lime green, dirt, carolina blue, robin egg blue, red brown, rust brown, lavender blue, crimson, red wine, easter green, baby green, light aqua, deep lavender, brown grey, hazel, periwinkle, pea green, kiwi green, brick red, poo, perrywinkle, baby poop green, periwinkle blue, icky green, lichen, acid green, mint green, avocado, light teal, foam green, reddish purple, faded purple, mulberry, brown red, grey, pea soup, baby poop, purplish, puke brown, purpley grey, pea soup green, barf green, sickly green, warm purple, cool grey, light blue, dark magenta, warm brown, deep lilac, greenish grey, booger green, light green, warm grey, blood red, purply, purpleish, sepia, robin's egg blue, light sea green, vivid purple, purple red, berry, reddish grey, slime green, deep red, violet, auburn, raw sienna, puke green, light grass green, amethyst, yellowish brown, dark khaki, booger, hospital green, brownish, dark lilac, bright olive, kiwi, carmine, dark fuchsia, light plum, mocha, sick green, light grey blue, snot green, bright yellow green, cranberry, red violet, brownish red, medium purple, burnt red, diarrhea, mint, deep magenta, barney purple, brick, burnt umber, gross green, light seafoam, russet, light maroon, earth, vomit, pastel blue, baby blue, ugly purple, heather, light olive green, pea, violet red, lightish purple, lighter purple, puce, cement, puke, pale turquoise, soft purple, coffee, light moss green, light mint green, raw umber, light seafoam green, rust, light burgundy, bronze, wisteria, dark mustard, dark sand, greyish, mustard green, electric lime, darkish red, sienna, tan green, spring green, electric purple, rust red, khaki, lime, rouge, tan brown, baby poo, barney, cinnamon, leather, mustard brown, dusty lavender, dark beige, snot, light olive, cloudy blue, light cyan, vibrant purple, bright violet, light brown, baby shit brown, stone, lemon green, mauve, yellowy brown, light lime, key lime, rusty red, caramel, dark tan, bland, raspberry, purplish red, burnt sienna, yellowish green, pastel green, orangey brown, pinkish brown, pale brown, powder blue, pale olive green, pale light green, pale lime green, orangish brown, umber, clay brown, golden brown, brown yellow, dust, light pastel green, light urple, dark rose, dark gold, bile, green/yellow, copper, clay, baby puke green, light mint, burnt siena, pale purple, yellow brown, light blue grey, light grey green, pale cyan, pale aqua, dusty red, brown orange, taupe, pale olive, light lime green, dusky rose, mushroom, dull red, yellowgreen, neon purple, greenish tan, light sage, washed out green, adobe, pale sky blue, tea green, scarlet, rose red, bright purple, orange brown, putty, pale lime, celadon, light purple, ochre, ocher, muddy yellow, yellowy green, lemon lime, lipstick red, burnt orange, easter purple, dusty rose, pistachio, yellow green, brick orange, light periwinkle, chartreuse, celery, magenta, brownish pink, light mauve, olive yellow, puke yellow, light yellowish green, grey pink, duck egg blue, reddish, rust orange, liliac, sandy brown, light pea green, eggshell blue, silver, dark orange, ocre, camel, greeny yellow, light sky blue, deep rose, bright lavender, old pink, lavender, toupe, vomit yellow, pale green, purpley pink, dark salmon, orchid, dirty orange, old rose, greyish pink, pinkish grey, yellow/green, light light green, pinky purple, bright lilac, terra cotta, sandstone, brownish yellow, greenish beige, green yellow, ruby, terracotta, browny orange, dirty pink, baby purple, pastel purple, light light blue, hot purple, deep pink, dark pink, terracota, brownish orange, yellow ochre, sand brown, pear, dusky pink, desert, light yellow green, rusty orange, ugly pink, dirty yellow, greenish yellow, purplish pink, lilac, pale violet, mustard, cherry, dark coral, rose, fawn, very pale green, neon yellow, ugly yellow, sickly yellow, lime yellow, pale blue, muted pink, tan, very light green, mustard yellow, faded red, very light brown, pinkish, really light blue, lipstick, dull pink, dusty pink, burnt yellow, dark yellow, very light blue, pinkish purple, light violet, ice, very pale blue, purple/pink, pale magenta, ice blue, dull orange, light grey, dark hot pink, heliotrope, pale red, pinkish tan, darkish pink, pink purple, pastel red, gold, deep orange, lavender pink, piss yellow, cerise, dark peach, faded pink, purpleish pink, light lavender, purple pink, pumpkin, sand, pale lilac, red, beige, light khaki, pig pink, tomato red, fuchsia, light lilac, pale lavender, dull yellow, pink/purple, tomato, macaroni and cheese, light lavendar, purply pink, dusty orange, faded orange, pinkish red, sandy, off yellow, blush, squash, medium pink, vermillion, orangish red, maize, hot magenta, pink red, golden, rosy pink, very light purple, cherry red, rose pink, light mustard, reddish orange, orange, golden rod, red pink, orangey red, light magenta, goldenrod, yellowish, banana yellow, strawberry, warm pink, violet pink, pumpkin orange, wheat, light tan, pinky red, coral, orangish, pinky, yellow orange, marigold, sand yellow, straw, yellowish tan, red orange, orange red, watermelon, grapefruit, carnation, orangeish, light orange, soft pink, butterscotch, orangey yellow, pale rose, light gold, pale gold, sandy yellow, pale grey, lemon yellow, lemon, canary, fire engine red, neon pink, bright pink, shocking pink, reddish pink, lightish red, orangered, barbie pink, blood orange, salmon pink, blush pink, bubblegum pink, rosa, light salmon, saffron, amber, golden yellow, pale mauve, dandelion, buff, parchment, faded yellow, ecru, bright red, hot pink, electric pink, neon red, strong pink, bright magenta, light red, bright orange, coral pink, candy pink, bubble gum pink, bubblegum, orange pink, pinkish orange, melon, salmon, carnation pink, pink, tangerine, pastel orange, peachy pink, mango, pale orange, yellowish orange, orange yellow, peach, apricot, pale salmon, powder pink, baby pink, pastel pink, sunflower, light rose, pale pink, light pink, light peach, sunflower yellow, sun yellow, yellow tan, pale peach, dark cream, very light pink, sunny yellow, pale, manilla, egg shell, bright yellow, sunshine yellow, butter yellow, custard, canary yellow, pastel yellow, light yellow, light beige, yellow, banana, butter, pale yellow, creme, cream, ivory, eggshell, off white, white

</details>

## Color Palettes

You can add your own color palette: the class `ColorName` can handle any inherited palette from `Palette`.

The [helper table](https://docs.google.com/spreadsheets/d/1f8wvrgqfGcXFAiAXx-p9CgLXo3__IoEn8-Us-uRyfok/copy).

## Color Converters

The formulas for color conversion are easily programmable, but we have many converters. So let's summarize them into the table:

| 👇 structures      | cmyk | rgb | hsl | hsv | xyz | 👈 models |
| ------------------ | ---- | --- | --- | --- | --- | --------- |
| int                |      |     |     |     |     |           |
| String             |      |     |     |     |     |           |
| UniColor\<double\> |      |     |     |     |     |           |
| UniColor\<int\>    |      |     |     |     |     |           |
| Iterable\<double\> |      |     |     |     |     |           |
| Iterable\<int\>    |      |     |     |     |     |           |

TODO A converter name using as extension and constructing by these schema: `color[SourceModel]To[Structure][ResultModel]()`.

For example:

`colorRgbToIntCmyk`
`colorRgbToInt`
`colorRgbToIntHsl`
...
`colorRgbToStringCmyk`
`colorRgbToString`
...
`colorRgbToUniColorDoubleCmyk`
`colorRgbToUniColorDouble`
...
`colorRgbToUniColorIntCmyk`
...
`colorCmykToIterableDoubleRgb`
`colorCmykToIterableInt`
...
`colorRgbToIterableIntHsv`
`colorXyzToIterableIntXyz`

Examples of using:

```dart
// as RGB model by default
0xCC00DE.colorToString();

// represent as XYZ model before transformation
0xCC00DE.model(ColorModel.hsl).colorToString();
// or with same result
0xCC00DE.colorModelHsl.colorToString();

// as RGB model by default
'cc00de'.colorToInt();

// 255 is a max value for the channel for normalize a color to range [0.0; 1.0]
[1, 12, 128].colorToUniColorDouble(255);
// the result will be `(1 / 255, 12 / 255, 128 / 255)`

// but in this case
[1, 12, 128].colorToUniColorDouble();
// the result will be `(1.0, 12.0, 128.0)`

[0.1, 0.12, 0.128].colorToUniColorInt(255);
// the result for this example: `(0.1 * 255, 0.12 * 255, 0.128 * 255)`
```

## Welcome

Requests and suggestions are warmly welcome.

This package is open-source, stable and well-tested. Development happens on
[GitHub](https://github.com/signmotion/uni_color_name). Feel free to report issues
or create a pull-request there.

General questions are best asked on
[StackOverflow](https://stackoverflow.com/questions/tagged/uni_color_name).

## Resources

Working on this project, I found amazing resources and am grateful to the authors:

- <https://thecolorapi.com>
  Pass in any valid color and get conversion into any other format, the name of the color, placeholder images and a multitude of schemes.
- <https://colorhexmap.com>
  Get Ready to Explore a World of Color.
- <https://en.m.wikipedia.org/wiki/List_of_color_palettes>

## TODO

- Feautures for this package into `README`.
- Converters between models. See [1](https://pub.dev/packages/color_models), [2](https://dev.to/bytebodger/determining-the-rgb-distance-between-two-colors-4n91), [3](https://github.com/MichaelFenwick/Color).
- Generalized to `num` instead of `double` and `int`? Reason: reduce a count of extensions.
- Converters between palettes.
- How to define your own map for color palette.
- Optimize a search.
- Fuzzy search by name.
- Fuzzy search by value.
- Range checker to each model.
- Autodetect a model when constructing a `Palette`.
- `operator[]` for getting a value by color name and vice versa.
- More palettes. See [1](https://en.wikipedia.org/wiki/List_of_colors:_A%E2%80%93F), [2](https://en.m.wikipedia.org/wiki/List_of_color_palettes), [3](https://en.wikipedia.org/wiki/Lists_of_colors).

- The range of values to check the integrity of the color.

- A converter name using as extension and constructing by these schema: `color[SourceModel]To[Structure][ResultModel]()`. For example: `colorRgbToIntCmyk`.

- Colors with transparent. <https://ftp.pwg.org/pub/pwg/candidates/cs-pwgmsn20-20130328-5101.1.pdf>

- Sources for color palettes.

- Pantone. <https://en.m.wikipedia.org/wiki/Pantone>
- Freetone. <https://en.m.wikipedia.org/wiki/Stuart_Semple#Freetone>

- RAL color system. <https://en.m.wikipedia.org/wiki/List_of_RAL_colours>
- HKS color system. <https://en.m.wikipedia.org/wiki/HKS_(colour_system)>
- Natural color system. <https://en.m.wikipedia.org/wiki/Natural_Color_System>

- Color blind friendly palettes. <https://commons.wikimedia.org/wiki/Commons:Creating_accessible_illustrations>

- Color characteristics? For ex., LRV: <https://en.m.wikipedia.org/wiki/Light_reflectance_value> -> <https://thelandofcolor.com/lrv-light-reflectance-value-of-paint-colors>
  CR: <https://en.m.wikipedia.org/wiki/Color_rendering_index>

- Articles from <https://en.m.wikipedia.org/wiki/Index_of_color-related_articles>.
