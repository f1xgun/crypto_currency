import 'package:crypto_currency/core/services/storage/shared_preferences_provider.dart';
import 'package:crypto_currency/features/auth/presentation/pages/login_page.dart';
import 'package:crypto_currency/features/auth/presentation/pages/onboarding_page.dart';
import 'package:crypto_currency/features/auth/presentation/pages/splash_page.dart';
import 'package:crypto_currency/features/auth/presentation/providers/auth_controller_provider.dart';
import 'package:crypto_currency/features/coin_ranking_list/presentation/pages/ranking_page.dart';
import 'package:crypto_currency/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final _key = GlobalKey<NavigatorState>();

final routerProvider = Provider.autoDispose<GoRouter>((ref) {
  final router = RouterNotifier(ref);

  return GoRouter(
    debugLogDiagnostics: true,
    redirectLimit: 10,
    initialLocation: SplashPage.routeLocation,
    navigatorKey: _key,
    routes: router._routes,
    refreshListenable: router,
    redirect: (context, state) => router._redirectLogic(state),
  );
});

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen(
      authControllerProvider,
      (previous, next) => notifyListeners(),
    );
  }

  Future<String?> _redirectLogic(GoRouterState state) async {
    final bool isAuth = _ref.watch(authControllerProvider).maybeMap(
          authorized: (value) => true,
          orElse: () => false,
        );

    if (isAuth) return HomePage.routeLocation;

    final bool isOnboardingPage =
        state.fullPath == OnboardingPage.routeLocation;

    if (isOnboardingPage) {
      final seenOnboard = _ref
          .watch(sharedPreferencesProvider)
          .whenData((value) => value.getBool('seenOnboard'));
      if (seenOnboard is AsyncData) {
        if (seenOnboard.value == null || !seenOnboard.value!) {
          return OnboardingPage.routeLocation;
        }
        return LoginPage.routeLocation;
      }
    }

    final bool isLoginPage = state.fullPath == LoginPage.routeLocation;

    if (isLoginPage) return LoginPage.routeLocation;

    return LoginPage.routeLocation;
  }

  List<GoRoute> get _routes => [
        GoRoute(
          path: SplashPage.routeLocation,
          name: SplashPage.routeName,
          builder: (context, state) => const SplashPage(),
        ),
        GoRoute(
          path: OnboardingPage.routeLocation,
          name: OnboardingPage.routeName,
          builder: (context, state) => const OnboardingPage(),
        ),
        GoRoute(
          path: LoginPage.routeLocation,
          name: LoginPage.routeName,
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: HomePage.routeLocation,
          name: HomePage.routeName,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: RankingPage.routeLocation,
          name: RankingPage.routeName,
          builder: (context, state) => const RankingPage(),
        ),
      ];
}
