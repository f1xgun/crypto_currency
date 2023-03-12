import 'package:crypto_currency/widgets/indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:crypto_currency/main.dart';
import 'package:crypto_currency/size_config.dart';
import 'package:crypto_currency/pages/login_screen.dart';
import 'package:crypto_currency/widgets/filled_button.dart';
import 'package:crypto_currency/widgets/outlined_button.dart';

import 'package:crypto_currency/app_styles.dart';

class MyAppState extends ChangeNotifier {
  final int _numPages = 3;
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
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
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomSheet: BottomSheetWidget(
          isLast: _currentPage == MyAppState()._numPages - 1,
          pageController: _pageController,
          currentPage: _currentPage,
        ),
      ),
    );
  }
}

class PageOfOnboarding extends StatelessWidget {
  const PageOfOnboarding(
      {super.key,
      required this.urlImage,
      required this.title,
      required this.subtitle});

  final String urlImage;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image(
              image:
                  AssetImage('assets/images/onboarding_screen/$urlImage.png'),
              width: 300,
              height: 300,
            ),
          ),
          const SizedBox(height: 30.0),
          SizedBox(
            width: SizeConfig.blockSizeHorizontal! * 50,
            child: Text(
              title,
              style: kQuestrialBold.copyWith(
                fontSize: SizeConfig.blockSizeVertical! * 3,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          SizedBox(
            width: SizeConfig.blockSizeHorizontal! * 50,
            child: Text(
              subtitle,
              style: kQuestrialMedium.copyWith(
                fontSize: SizeConfig.blockSizeVertical! * 2,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
      for (int i = 0; i < appState._numPages; i++) {
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
