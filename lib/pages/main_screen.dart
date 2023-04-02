import 'package:crypto_currency/pages/main_screen_model.dart';
import 'package:crypto_currency/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model =
        MainScreenProvider.watch(context)!.notifier as MainScreenModel;

    return Scaffold(
      body: PageView.builder(
        controller: model.pageController,
        itemCount: model.pages.length,
        itemBuilder: (context, index) {
          return model.pages[model.selectedPageIndex];
        },
        onPageChanged: model.onChangePage,
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
