import 'package:crypto_currency/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class PageOfOnboarding extends StatelessWidget {
  final String urlImage;
  final String title;
  final String subtitle;

  const PageOfOnboarding({
    required this.urlImage,
    required this.title,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          'assets/images/onboarding_screen/$urlImage.png',
          fit: BoxFit.fill,
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Text(
                  title,
                  style: context.textStyles.h2.copyWith(
                    color: context.colors.mainText,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                child: Text(
                  subtitle,
                  style: context.textStyles.caption1.copyWith(
                    color: context.colors.mainText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
