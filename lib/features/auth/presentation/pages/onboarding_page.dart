import 'package:crypto_currency/core/extensions/build_context_extension.dart';
import 'package:crypto_currency/core/l10n/s.dart';
import 'package:crypto_currency/core/widgets/indicator.dart';
import 'package:crypto_currency/features/auth/domain/entities/onboarding_page_model.dart';
import 'package:crypto_currency/features/auth/presentation/widgets/onboarding_buttons.dart';
import 'package:crypto_currency/features/auth/presentation/widgets/onboarding_image_page_view.dart';
import 'package:crypto_currency/features/auth/presentation/widgets/onboarding_page_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardingPage extends StatefulWidget {
  static String get routeName => 'onboarding';
  static String get routeLocation => '/onboarding';
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentPage = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  void nextPage() {
    setState(() {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
      _currentPage++;
    });
  }

  void goToPage(int index) {
    setState(() {
      _pageController.jumpToPage(index);
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<OnboardingPageModel> pages = [
      OnboardingPageModel(
        urlImage: 'all_crypto',
        title: S.of(context).titleForFirstOnboaringPage,
        subtitle: S.of(context).subTitleForFirstOnboaringPage,
      ),
      OnboardingPageModel(
        urlImage: 'buy_sell_crypto',
        title: S.of(context).titleForSecondOnboaringPage,
        subtitle: S.of(context).subTitleForSecondOnboaringPage,
      ),
      OnboardingPageModel(
        urlImage: 'security_system',
        title: S.of(context).titleForThirdOnboaringPage,
        subtitle: S.of(context).subTitleForThirdOnboaringPage,
      ),
    ];

    return Scaffold(
      body: ColoredBox(
        color: context.colors.background,
        child: SafeArea(
          top: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: OnboardingImagePageView(
                  pageController: _pageController,
                  pages: pages,
                  onPageChanged: (value) => setState(() {
                    _currentPage = value;
                  }),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(children: [
                        for (var i = 0; i < pages.length; i++)
                          InkWell(
                            radius: 50,
                            child: Ink(
                              child: Indicator(isActive: i == _currentPage),
                            ),
                            onTap: () => goToPage(i),
                          ),
                      ]),
                      const SizedBox(height: 15),
                      OnboardingPageText(
                          pages: pages, currentPage: _currentPage),
                      const SizedBox(height: 30),
                      OnboardingButtons(
                        isLastPage: _currentPage == pages.length - 1,
                        nextPage: nextPage,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
