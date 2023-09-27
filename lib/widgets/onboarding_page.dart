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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Center(
              child: Image.asset(
                'assets/images/onboarding_screen/$urlImage.png',
                width: 300,
                height: 300,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
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
      ),
    );
  }
}
