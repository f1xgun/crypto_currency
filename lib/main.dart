import 'dart:async';

import 'package:crypto_currency/core/l10n/s.dart';
import 'package:crypto_currency/core/logger/logger.dart';
import 'package:crypto_currency/core/router/router.dart';
import 'package:crypto_currency/core/services/storage/shared_preferences_provider.dart';
import 'package:crypto_currency/core/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    final container = ProviderContainer();

    await container.read(sharedPreferencesProvider.future);

    runApp(
        UncontrolledProviderScope(container: container, child: const MyApp()));
  }, (error, stack) {
    logger.error(message: error.toString(), e: error, stackTrace: stack);
  });
}

class MyApp extends ConsumerWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'Crypto Currency',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      localizationsDelegates: S.localizationDelegates,
      locale: S.en,
      supportedLocales: S.supportedLocales,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
    );
  }
}
