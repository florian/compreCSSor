padding0
========

A CSS minifier built with Ruby — Work in progress.

# Ways to minify the CSS

- Combine selectors. (This will probably reduce the code more than anything else, so it has to be done really good.)
- Combine properties into shorthand properties if possible. (E.g. `margin-top`, `margin-right`, `margin-bottom` and `margin-left` into `margin`.)
- Remove all whitespace characters and `/* */` comments if they are not inside a string. This will be done automatically because of the way the CSS is parsed and rearranged.
- Omit the last semicolon as it's optional.
- Replace `none` and `0` followed by a suffix (`px`, `em` and so on) with `0` as they do the same thing.
- Replace the `font-weight` values `normal` and `bold` with their corresponding numeric values `400` and `700`.
- Replace `rgb`, `hsl`, `rgba` / `hsla` with `1` as the alpha value, `cymk` and the color keywords if they are longer than 4 or 7 characters with their corresponding HEX values. Use the color keywords if they are shorter than the corresponding HEX values. (E.g. `red` instead of `#f00`.)
- Use shorthand HEX values if possible. (`#f80` instead of `#ff8800`.)

# Contributing

If you've found any bugs or have suggestions, let us know!<br />
Or if you want, you can fork this project on [GitHub](https://github.com/js-coder/padding0) and create a pull request.

# Credits :)

**Authors:** <br />
Florian H. <br />
Mogria <m0gr14@gmail.com>

**License:** <br />
MIT, see `LICENSE`