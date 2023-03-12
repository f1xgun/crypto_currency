import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:crypto_currency/app_styles.dart';
import 'package:crypto_currency/main.dart';
import 'package:crypto_currency/pages/login_screen.dart';
import 'package:crypto_currency/pages/onboarding_screen.dart';
import 'package:crypto_currency/widgets/filled_button.dart';
import 'package:crypto_currency/widgets/indicator.dart';
import 'package:crypto_currency/widgets/outlined_button.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget(
      {super.key,
      required this.isLast,
      required this.pageController,
      required this.currentPage});
  final bool isLast;
  final PageController pageController;
  final int currentPage;

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  Future setSeenonboard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    seenOnboard = await prefs.setBool('seenOnboard', true);
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    List<Widget> _buildPageIndicator() {
      List<Widget> list = [];
      for (int i = 0; i < appState.numPages; i++) {
        list.add(i == widget.currentPage
            ? const Indicator(isActive: true)
            : const Indicator(isActive: false));
      }
      return list;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      color: kBackgroundColor,
      height: 240,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: _buildPageIndicator(),
          ),
          const SizedBox(
            height: 15,
          ),
          CustomFilledButton(
            onPressed: () {
              widget.isLast
                  ? Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
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
              if (widget.isLast) setSeenonboard();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            text: widget.isLast ? 'Dont show again' : 'Skip',
          ),
        ],
      ),
    );
  }
}
