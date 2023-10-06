import 'package:crypto_currency/core/extensions/build_context_extension.dart';
import 'package:crypto_currency/core/l10n/s.dart';
import 'package:crypto_currency/widgets/onboarding_bottomsheet.dart';
import 'package:crypto_currency/widgets/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

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
  final PageController _pageController = PageController();

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
          child: ColoredBox(
            color: context.colors.background,
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
                        onPageChanged: (page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        children: <Widget>[
                          PageOfOnboarding(
                            urlImage: 'all_crypto',
                            title: S.of(context).titleForFirstOnboaringPage,
                            subtitle:
                                S.of(context).subTitleForFirstOnboaringPage,
                          ),
                          PageOfOnboarding(
                            urlImage: 'buy_sell_crypto',
                            title: S.of(context).titleForSecondOnboaringPage,
                            subtitle:
                                S.of(context).subTitleForSecondOnboaringPage,
                          ),
                          PageOfOnboarding(
                            urlImage: 'security_system',
                            title: S.of(context).titleForThirdOnboaringPage,
                            subtitle:
                                S.of(context).subTitleForThirdOnboaringPage,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: OnboardingBottomSheetWidget(
                        isLast: _currentPage == MyAppState()._numPages - 1,
                        pageController: _pageController,
                        currentPage: _currentPage,
                      ),
                    ),
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
