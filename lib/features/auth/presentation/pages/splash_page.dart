import 'package:crypto_currency/core/extensions/build_context_extension.dart';
import 'package:crypto_currency/core/router/router.dart';
import 'package:crypto_currency/core/services/storage/shared_preferences_provider.dart';
import 'package:crypto_currency/features/auth/presentation/pages/login_page.dart';
import 'package:crypto_currency/features/auth/presentation/pages/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatelessWidget {
  static String get routeName => 'splash';
  static String get routeLocation => '/splash';

  const SplashPage({super.key});

  Future<void> redirectToOnboardingPage(
      AsyncValue<SharedPreferences> sharedPreferencesAsync,
      WidgetRef ref) async {
    final seenOnboard = sharedPreferencesAsync
        .whenData((value) => value.getBool('seenOnboard'));
    if (seenOnboard is AsyncData) {
      if (seenOnboard.value == null || !seenOnboard.value!) {
        ref.read(routerProvider).go(OnboardingPage.routeLocation);
      } else {
        ref.read(routerProvider).go(LoginPage.routeLocation);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final sharedPreferencesAsync = ref.watch(sharedPreferencesProvider);

        return FutureBuilder(
          future: redirectToOnboardingPage(sharedPreferencesAsync, ref),
          builder: (context, snapshot) => ColoredBox(
            color: context.colors.background,
            child: SafeArea(
              child: Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: const CircularProgressIndicator(),
                        margin: const EdgeInsets.all(5),
                      ),
                      Text(
                        'CryptoCurrency App',
                        style: context.textStyles.bold,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
