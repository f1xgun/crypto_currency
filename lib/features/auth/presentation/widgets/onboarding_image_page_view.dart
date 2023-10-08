import 'package:crypto_currency/features/auth/domain/entities/onboarding_page_model.dart';
import 'package:flutter/material.dart';

class OnboardingImagePageView extends StatelessWidget {
  final PageController pageController;
  final List<OnboardingPageModel> pages;
  final Function(int) onPageChanged;

  const OnboardingImagePageView({
    required this.pages,
    required this.onPageChanged,
    required this.pageController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: pages.length,
      itemBuilder: (context, index) {
        return Image.asset(
          'assets/images/onboarding_screen/${pages[index].urlImage}.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        );
      },
      onPageChanged: onPageChanged,
    );
  }
}
