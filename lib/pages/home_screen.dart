import 'package:crypto_currency/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colors.background,
        title: Text(
          'Home',
          style: context.textStyles.h2.copyWith(
            color: context.colors.mainText,
          ),
        ),
      ),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
