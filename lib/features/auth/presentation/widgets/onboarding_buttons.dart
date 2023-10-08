import 'package:crypto_currency/core/l10n/s.dart';
import 'package:crypto_currency/core/router/router.dart';
import 'package:crypto_currency/core/widgets/filled_button.dart';
import 'package:crypto_currency/core/widgets/outlined_button.dart';
import 'package:crypto_currency/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingButtons extends ConsumerWidget {
  final bool isLastPage;
  final VoidCallback nextPage;

  const OnboardingButtons(
      {required this.isLastPage, required this.nextPage, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(routerProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomFilledButton(
          onPressed: () {
            isLastPage ? router.go(LoginPage.routeLocation) : nextPage();
          },
          text: isLastPage ? S.of(context).getStarted : S.of(context).next,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomOutlinedButton(
          onPressed: () => router.go(LoginPage.routeLocation),
          text: isLastPage ? S.of(context).dontShowAgain : S.of(context).skip,
        ),
      ],
    );
  }
}
