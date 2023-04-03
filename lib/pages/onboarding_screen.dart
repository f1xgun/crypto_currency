import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:crypto_currency/widgets/onboarding_bottomsheet.dart';
import 'package:crypto_currency/widgets/onboarding_page.dart';
import 'package:provider/provider.dart';
import 'package:crypto_currency/app_styles.dart';

class MyAppState extends ChangeNotifier {
  final int _numPages = 3;

  int get numPages => _numPages;
}

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
            color: kBackgroundColor,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: PageView(
                        physics: const ClampingScrollPhysics(),
                        controller: _pageController,
                        onPageChanged: (int page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        children: const <Widget>[
                          PageOfOnboarding(
                              urlImage: 'coins',
                              title: "All your crypto in one place",
                              subtitle:
                                  "Already any coin and token on Cryptostone"),
                          PageOfOnboarding(
                              urlImage: 'cryptowallet',
                              title: "Buy and Sell Your Crypto",
                              subtitle:
                                  "Easy buy and sell crypto on cryptostore"),
                          PageOfOnboarding(
                              urlImage: 'exchange',
                              title: "Security System for your wallet",
                              subtitle:
                                  "Guarantee for security on cryptostore"),
                        ],
                      ),
                    ),
                    Expanded(
                      child: OnboardingBottomSheetWidget(
                        isLast: _currentPage == MyAppState()._numPages - 1,
                        pageController: _pageController,
                        currentPage: _currentPage,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
