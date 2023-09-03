import 'package:crypto_currency/core/themes/colors_palette.dart';
import 'package:crypto_currency/core/themes/text_styles.dart';
import 'package:crypto_currency/core/themes/theme_style.dart';
import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  ColorsPalette get colors => Theme.of(this).extension<ThemeStyle>()!.colors;

  TextStyles get textStyles => Theme.of(this).extension<ThemeStyle>()!.styles;

  Brightness get brightness =>
      Theme.of(this).extension<ThemeStyle>()!.brightness;
}
