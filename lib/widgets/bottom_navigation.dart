import 'package:crypto_currency/app_styles.dart';
import 'package:crypto_currency/pages/main_screen_model.dart';
import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model =
        MainScreenProvider.watch(context)!.notifier as MainScreenModel;

    return BottomNavigationBar(
      items: model.pagesBottomBar
          .map(
            (e) => BottomNavigationBarItem(
              icon: e.icon,
              label: e.label,
              activeIcon: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: <Color>[Color(0xff814EBB), Color(0xffff56bb)],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  ).createShader(bounds);
                },
                child: e.icon,
              ),
            ),
          )
          .toList(),
      onTap: model.onChangePage,
      currentIndex: model.selectedPageIndex,
      backgroundColor: kBackgroundColor,
      mouseCursor: SystemMouseCursors.click,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 32,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.white,
    );
  }
}
