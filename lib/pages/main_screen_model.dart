import 'package:crypto_currency/models/bottom_navigation_item.dart';
import 'package:crypto_currency/pages/home_screen.dart';
import 'package:crypto_currency/pages/home_screen_model.dart';
import 'package:crypto_currency/pages/ranking_screen.dart';
import 'package:crypto_currency/pages/ranking_screen_model.dart';
import 'package:flutter/material.dart';

class MainScreenModel extends ChangeNotifier {
  int _selectedPageIndex = 0;
  final PageController _pageController = PageController();

  int get selectedPageIndex => _selectedPageIndex;
  PageController get pageController => _pageController;

  final List<InheritedNotifier> pages = [
    HomeScreenProvider(
      notifier: HomeScreenModel(),
      child: const HomePage(),
    ),
    RankingScreenProvider(
      notifier: RankingScreenModel(),
      child: const RankingPage(),
    )
  ];

  final List<BottomNavigationItem> pagesBottomBar = [
    const BottomNavigationItem(Icon(Icons.home_filled), 'Home'),
    const BottomNavigationItem(Icon(Icons.bar_chart), 'Ranking'),
  ];

  void onChangePage(int index) {
    _selectedPageIndex = index;
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    notifyListeners();
  }
}

class MainScreenProvider extends InheritedNotifier {
  const MainScreenProvider({
    required super.child,
    required MainScreenModel super.notifier,
    super.key,
  });

  static MainScreenProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MainScreenProvider>();
  }

  static MainScreenProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<MainScreenProvider>()
        ?.widget;
    return widget is MainScreenProvider ? widget : null;
  }
}
