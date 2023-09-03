import 'package:crypto_currency/core/themes/colors_palette.dart';
import 'package:crypto_currency/core/themes/text_styles.dart';
import 'package:flutter/material.dart';

class ThemeStyle extends ThemeExtension<ThemeStyle> {
  final ColorsPalette colors;
  final TextStyles styles;
  final Brightness brightness;

  ThemeStyle({
    required this.colors,
    required this.styles,
    required this.brightness,
  });

  @override
  ThemeExtension<ThemeStyle> copyWith() => this;

  @override
  ThemeExtension<ThemeStyle> lerp(
          covariant ThemeExtension<ThemeStyle>? other, double t) =>
      this;
}
