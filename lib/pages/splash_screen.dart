import 'dart:async';

import 'package:crypto_currency/core/extensions/build_context_extension.dart';
import 'package:crypto_currency/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Future<void> initState() async {
    super.initState();
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final bool seenOnboard = pref.getBool('seenOnboard') ?? false;
    Timer(
      const Duration(seconds: 1),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => MyApp(seenOnboard: seenOnboard),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: height,
          width: width,
          color: context.colors.background,
          child: Center(
            child: Text(
              'CryptoCurrency App',
              style: context.textStyles.bold,
            ),
          ),
        ),
      ),
    );
  }
}
