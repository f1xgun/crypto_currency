import 'package:crypto_currency/core/themes/colors_palette.dart';
import 'package:crypto_currency/core/themes/text_styles.dart';
import 'package:crypto_currency/core/themes/theme_style.dart';
import 'package:flutter/material.dart' hide Colors;

class AppTheme {
  static ThemeData get lightTheme =>
      ThemeData.light(useMaterial3: true).copyWith(
        colorScheme: ColorScheme.light(
          primary: lightPalette.dark,
          secondary: lightPalette.white,
        ),
        extensions: [
          ThemeStyle(
            colors: lightPalette,
            styles: textStyles,
            brightness: Brightness.light,
          ),
        ],
      );

  static ThemeData get darkTheme => ThemeData.dark(useMaterial3: true).copyWith(
        colorScheme: ColorScheme.dark(
          primary: lightPalette.white,
          secondary: lightPalette.dark,
        ),
        extensions: [
          ThemeStyle(
            colors: darkPalette,
            styles: textStyles,
            brightness: Brightness.dark,
          ),
        ],
      );

  static const ColorsPalette lightPalette = ColorsPalette(
    mainText: Colors.dark,
    subText: Colors.dark70,
    background: Colors.white,
    transparentButtonText: Colors.purpleDark,
    inActiveBackground: Colors.white30,
    priceDownBackground: Colors.redLight,
    priceUpText: Colors.greenDark,
    priceUpBackground: Colors.green,
    priceUpTradeText: Colors.greenBoldLight,
    white: Colors.white,
    white50: Colors.white50,
    white30: Colors.white30,
    dark70: Colors.dark70,
    dark80: Colors.dark80,
    dark: Colors.dark,
    greenDark: Colors.greenDark,
    greenLight: Colors.greenLight,
    greenBoldLight: Colors.greenBoldLight,
    green: Colors.green,
    redDark: Colors.redDark,
    red: Colors.red,
    redLight: Colors.redLight,
    purple: Colors.purple,
    purpleDark: Colors.purpleDark,
    yellow: Colors.yellow,
    purplePinkGradient: Colors.purplePinkGradient,
    purpleBlackGradient: Colors.purpleBlackGradient,
  );

  static const ColorsPalette darkPalette = ColorsPalette(
    mainText: Colors.white,
    subText: Colors.white50,
    background: Colors.dark,
    transparentButtonText: Colors.white,
    inActiveBackground: Colors.dark80,
    priceDownBackground: Colors.redDark,
    priceUpText: Colors.green,
    priceUpBackground: Colors.greenDark,
    priceUpTradeText: Colors.green,
    white: Colors.white,
    white50: Colors.white50,
    white30: Colors.white30,
    dark70: Colors.dark70,
    dark80: Colors.dark80,
    dark: Colors.dark,
    greenDark: Colors.greenDark,
    greenLight: Colors.greenLight,
    greenBoldLight: Colors.greenBoldLight,
    green: Colors.green,
    redDark: Colors.redDark,
    red: Colors.red,
    redLight: Colors.redLight,
    purple: Colors.purple,
    purpleDark: Colors.purpleDark,
    yellow: Colors.yellow,
    purplePinkGradient: Colors.purplePinkGradient,
    purpleBlackGradient: Colors.purpleBlackGradient,
  );

  static const TextStyles textStyles = TextStyles(
    body: SFProDisplayStyles.body,
    bold: SFProDisplayStyles.bold,
    caption1: SFProDisplayStyles.caption1,
    caption2: SFProDisplayStyles.caption2,
    h1: SFProDisplayStyles.h1,
    h2: SFProDisplayStyles.h2,
    h3: SFProDisplayStyles.h3,
    h4: SFProDisplayStyles.h4,
    headline: SFProDisplayStyles.headline,
  );
}
