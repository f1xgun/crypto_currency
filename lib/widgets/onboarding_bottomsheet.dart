import 'package:crypto_currency/core/extensions/build_context_extension.dart';
import 'package:crypto_currency/pages/login_screen.dart';
import 'package:crypto_currency/pages/onboarding_screen.dart';
import 'package:crypto_currency/widgets/filled_button.dart';
import 'package:crypto_currency/widgets/indicator.dart';
import 'package:crypto_currency/widgets/outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingBottomSheetWidget extends StatefulWidget {
  final bool isLast;
  final PageController pageController;
  final int currentPage;

  const OnboardingBottomSheetWidget({
    required this.isLast,
    required this.pageController,
    required this.currentPage,
    super.key,
  });

  @override
  State<OnboardingBottomSheetWidget> createState() =>
      _OnboardingBottomSheetWidgetState();
}

class _OnboardingBottomSheetWidgetState
    extends State<OnboardingBottomSheetWidget> {
  Future<void> setSeenonboard() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seenOnboard', true);
  }

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<MyAppState>();

    List<Widget> buildPageIndicator() {
      final list = <Widget>[];
      for (var i = 0; i < appState.numPages; i++) {
        list.add(
          i == widget.currentPage
              ? const Indicator(isActive: true)
              : const Indicator(isActive: false),
        );
      }
      return list;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      color: context.colors.background,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: buildPageIndicator(),
          ),
          const SizedBox(height: 15),
          CustomFilledButton(
            onPressed: () {
              widget.isLast
                  ? Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    )
                  : widget.pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
            },
            text: widget.isLast ? 'Get started' : 'Next',
          ),
          const SizedBox(
            height: 10,
          ),
          CustomOutlinedButton(
            onPressed: () {
              setSeenonboard();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
            text: widget.isLast ? 'Dont show again' : 'Skip',
          ),
        ],
      ),
    );
  }
}
