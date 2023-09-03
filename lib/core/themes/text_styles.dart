import 'package:flutter/material.dart';

class TextStyles {
  final TextStyle h1;
  final TextStyle h2;
  final TextStyle h3;
  final TextStyle h4;
  final TextStyle headline;
  final TextStyle body;
  final TextStyle bold;
  final TextStyle caption1;
  final TextStyle caption2;

  const TextStyles({
    required this.h1,
    required this.h2,
    required this.h3,
    required this.h4,
    required this.headline,
    required this.body,
    required this.bold,
    required this.caption1,
    required this.caption2,
  });
}

class SFProDisplayStyles {
  const SFProDisplayStyles._();

  static const _fontFamily = 'SF Pro Display';

  static const h1 = TextStyle(
    fontSize: 32,
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w900,
    height: 32 / 40,
  );

  static const h2 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 30,
    fontWeight: FontWeight.w700,
    height: 30 / 38,
  );

  static const h3 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 26,
    fontWeight: FontWeight.w600,
    height: 26 / 34,
  );

  static const h4 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 18 / 26,
  );

  static const headline = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 15,
    height: 15 / 23,
    fontWeight: FontWeight.w700,
  );

  static const body = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 15,
    height: 15 / 23,
    fontWeight: FontWeight.w400,
  );

  static const bold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    height: 14 / 22,
    fontWeight: FontWeight.w700,
  );

  static const caption1 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 13,
    height: 13 / 16,
    fontWeight: FontWeight.w400,
  );

  static const caption2 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    height: 12 / 16,
    fontWeight: FontWeight.w400,
  );
}
