import 'dart:async';

import 'package:crypto_currency/core/logger/logger.dart';
import 'package:crypto_currency/core/themes/app_theme.dart';
import 'package:crypto_currency/pages/login_screen.dart';
import 'package:crypto_currency/pages/main_screen.dart';
import 'package:crypto_currency/pages/main_screen_model.dart';
import 'package:crypto_currency/pages/onboarding_screen.dart';
import 'package:crypto_currency/pages/ranking_screen.dart';
import 'package:crypto_currency/pages/ranking_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final bool seenOnboard = pref.getBool('seenOnboard') ?? false;
    runApp(ProviderScope(child: MyApp(seenOnboard: seenOnboard)));
  }, (error, stack) {
    logger.error(error.toString(), error, stack);
  });
}

class MyApp extends StatelessWidget {
  final bool seenOnboard;

  const MyApp({
    required this.seenOnboard,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Currency',
      theme: AppTheme.darkTheme,
      home: seenOnboard ? const LoginPage() : const OnboardingPage(),
      routes: <String, WidgetBuilder>{
        '/login': (context) => const LoginPage(),
        '/ranking': (context) => RankingScreenProvider(
              notifier: RankingScreenModel(),
              child: const RankingPage(),
            ),
        '/home': (context) => MainScreenProvider(
              notifier: MainScreenModel(),
              child: const MainScreen(),
            ),
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
