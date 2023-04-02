import 'package:crypto_currency/pages/main_screen.dart';
import 'package:crypto_currency/pages/main_screen_model.dart';
import 'package:crypto_currency/pages/ranking_screen.dart';
import 'package:crypto_currency/pages/ranking_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:crypto_currency/pages/login_screen.dart';
import 'package:crypto_currency/pages/onboarding_screen.dart';

bool? seenOnboard;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  seenOnboard = pref.getBool('seenOnboard') ?? false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Currency',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: seenOnboard == true ? const LoginPage() : const OnboardingPage(),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => const LoginPage(),
        '/ranking': (BuildContext context) => RankingScreenProvider(
              notifier: RankingScreenModel(),
              child: const RankingPage(),
            ),
        '/home': (BuildContext context) => MainScreenProvider(
              notifier: MainScreenModel(),
              child: const MainScreen(),
            ),
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
