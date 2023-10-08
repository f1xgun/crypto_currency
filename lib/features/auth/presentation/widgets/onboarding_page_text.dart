import 'package:crypto_currency/core/extensions/build_context_extension.dart';
import 'package:crypto_currency/features/auth/domain/entities/onboarding_page_model.dart';
import 'package:flutter/material.dart';

class OnboardingPageText extends StatelessWidget {
  final List<OnboardingPageModel> pages;
  final int currentPage;

  const OnboardingPageText(
      {required this.pages, required this.currentPage, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeOut,
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (child, animation) => SizeTransition(
        sizeFactor: animation,
        child: child,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Text(
              pages[currentPage].title,
              style: context.textStyles.h2.copyWith(
                color: context.colors.mainText,
              ),
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            child: Text(
              pages[currentPage].subtitle,
              style: context.textStyles.caption1.copyWith(
                color: context.colors.mainText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
