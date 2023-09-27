import 'dart:async';

import 'package:crypto_currency/core/logger/logger.dart';
import 'package:crypto_currency/core/services/storage/shared_preferences_provider.dart';
import 'package:crypto_currency/core/themes/app_theme.dart';
import 'package:crypto_currency/pages/login_screen.dart';
import 'package:crypto_currency/pages/main_screen.dart';
import 'package:crypto_currency/pages/main_screen_model.dart';
import 'package:crypto_currency/pages/onboarding_screen.dart';
import 'package:crypto_currency/pages/ranking_screen.dart';
import 'package:crypto_currency/pages/ranking_screen_model.dart';
import 'package:crypto_currency/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const ProviderScope(child: MyApp()));
  }, (error, stack) {
    logger.error(error.toString(), error, stack);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  Future<bool> isSeenOnboard(SharedPreferences sharedPreferences) async {
    return sharedPreferences.getBool('seenOnboard') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Currency',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: Consumer(
        builder: (context, ref, widget) {
          return FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!) {
                  return const LoginPage();
                }
                return const OnboardingPage();
              }
              return const SplashScreen();
            },
            future: ref.watch(sharedPreferencesProvider).when(
                  error: (e, stackTrace) {
                    logger.error(e.toString(), e, stackTrace);
                    return Future.value(false);
                  },
                  loading: () => null,
                  data: (value) async => isSeenOnboard(value),
                ),
          );
        },
      ),
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
