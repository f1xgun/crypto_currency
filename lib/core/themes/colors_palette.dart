import 'package:flutter/material.dart';

class ColorsPalette {
  final Color mainText;
  final Color subText;
  final Color background;
  final Color transparentButtonText;
  final Color inActiveBackground;
  final Color priceDownBackground;
  final Color priceUpText;
  final Color priceUpBackground;
  final Color priceUpTradeText;
  final Color prefixInputIcon;
  final Color suffixInput;
  final Color white;
  final Color white50;
  final Color white30;
  final Color dark70;
  final Color dark80;
  final Color dark;
  final Color greenDark;
  final Color greenLight;
  final Color greenBoldLight;
  final Color green;
  final Color redDark;
  final Color red;
  final Color redLight;
  final Color purple;
  final Color purpleDark;
  final Color yellow;

  final LinearGradient purplePinkGradient;
  final LinearGradient purpleBlackGradient;

  const ColorsPalette({
    required this.prefixInputIcon,
    required this.suffixInput,
    required this.mainText,
    required this.subText,
    required this.background,
    required this.transparentButtonText,
    required this.inActiveBackground,
    required this.priceDownBackground,
    required this.priceUpText,
    required this.priceUpBackground,
    required this.priceUpTradeText,
    required this.white,
    required this.white50,
    required this.white30,
    required this.dark70,
    required this.dark80,
    required this.dark,
    required this.greenDark,
    required this.greenLight,
    required this.greenBoldLight,
    required this.green,
    required this.redDark,
    required this.red,
    required this.redLight,
    required this.purple,
    required this.purpleDark,
    required this.yellow,
    required this.purplePinkGradient,
    required this.purpleBlackGradient,
  });
}

class Colors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color white50 = Color(0xFFBABABA);
  static const Color white30 = Color(0xFFF2F2F7);
  static const Color dark70 = Color(0xFF6B6B6B);
  static const Color dark80 = Color(0xFF161829);
  static const Color dark = Color(0xFF100118);
  static const Color greenDark = Color(0xFF0F4A35);
  static const Color greenLight = Color(0xFFBADDD0);
  static const Color greenBoldLight = Color(0xFF0B873C);
  static const Color green = Color(0xFF51EC8F);
  static const Color redDark = Color(0xFF3F1C1C);
  static const Color red = Color(0xFFFF2D52);
  static const Color redLight = Color(0xFFFFCACA);
  static const Color purple = Color(0xFFCC7EFD);
  static const Color purpleDark = Color(0xFF814EBB);
  static const Color yellow = Color(0xFFFAD84E);

  static const LinearGradient purplePinkGradient = LinearGradient(colors: [
    purpleDark,
    Color(0xFFFF56BB),
  ]);
  static const LinearGradient purpleBlackGradient = LinearGradient(colors: [
    purple,
    Color(0xFFA771ED),
    Color(0xFF3C1C9B),
  ]);
}
