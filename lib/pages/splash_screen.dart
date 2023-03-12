import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:crypto_currency/app_styles.dart';
import 'package:crypto_currency/pages/onboarding_screen.dart';
import 'package:crypto_currency/main.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() async {
    super.initState();
    SharedPreferences pref = await SharedPreferences.getInstance();
    seenOnboard = pref.getBool('seenOnboard') ?? false;
    Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const OnboardingPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: height,
          width: width,
          color: kBackgroundColor,
          child: Column(children: [
            Image.asset('assets/images/bitcoin_splash_screen.gif'),
            const Text('CryptoCurrency App',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold))
          ]),
        ),
      ),
    );
  }
}
