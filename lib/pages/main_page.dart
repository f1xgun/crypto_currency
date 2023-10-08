// import 'package:crypto_currency/pages/main_page_model.dart';
// import 'package:crypto_currency/core/widgets/bottom_navigation.dart';
// import 'package:flutter/material.dart';

// class MainPage extends StatelessWidget {
//   const MainPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final model = MainPageProvider.watch(context)!.notifier! as MainPageModel;

//     return Scaffold(
//       body: PageView.builder(
//         controller: model.pageController,
//         itemCount: model.pages.length,
//         itemBuilder: (context, index) {
//           return model.pages[model.selectedPageIndex];
//         },
//         onPageChanged: model.onChangePage,
//       ),
//       bottomNavigationBar: const BottomNavigationWidget(),
//     );
//   }
// }
