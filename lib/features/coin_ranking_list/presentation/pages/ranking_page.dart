import 'package:crypto_currency/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class RankingPage extends StatelessWidget {
  static String get routeName => 'ranking';
  static String get routeLocation => '/ranking';
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colors.background,
        title: Text(
          'Ranking',
          style: context.textStyles.h4.copyWith(color: context.colors.mainText),
        ),
      ),
      body: ColoredBox(
        color: context.colors.background,
        child: const SafeArea(
          child: CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: context.colors.mainText,
        onPressed: null,
        backgroundColor: context.colors.background,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
