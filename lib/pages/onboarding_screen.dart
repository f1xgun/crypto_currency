import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:crypto_currency/main.dart';
import 'package:crypto_currency/pages/login_screen.dart';
import 'package:crypto_currency/widgets/filled_button.dart';
import 'package:crypto_currency/widgets/outlined_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final int _numPages = 3;
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.purple[400] : Colors.grey,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }

  Future setSeenonboard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    seenOnboard = await prefs.setBool('seenOnboard', true);
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    setSeenonboard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          color: const Color.fromARGB(255, 32, 4, 66),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
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
                            subtitle: "Guarantee for security on cryptostore"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              color: Colors.purple[900],
              height: 160,
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
                    onPressed: () async {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                    text: 'Get Started',
                  ),
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              color: Colors.purple[900],
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
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease);
                    },
                    text: 'Next',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomOutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                    text: 'Skip',
                  ),
                ],
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
            width: MediaQuery.of(context).size.width * 0.5,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Text(
              subtitle,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
