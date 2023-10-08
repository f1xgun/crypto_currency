import 'package:crypto_currency/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String get routeName => 'home';
  static String get routeLocation => '/';

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
      body: ColoredBox(
        color: context.colors.background,
        child: const Center(
          child: Text('Home'),
        ),
      ),
    );
  }
}
