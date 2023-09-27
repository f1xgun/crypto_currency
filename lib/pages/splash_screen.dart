import 'package:crypto_currency/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ColoredBox(
          color: context.colors.background,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                Text(
                  'CryptoCurrency App',
                  style: context.textStyles.bold,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
