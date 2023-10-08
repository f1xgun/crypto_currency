// import 'package:crypto_currency/core/extensions/build_context_extension.dart';
// import 'package:flutter/material.dart';

// class BottomNavigationWidget extends StatelessWidget {
//   const BottomNavigationWidget({super.key});

//   @override
//   Widget build(BuildContext context) {

//     return BottomNavigationBar(
//       items: model.pagesBottomBar
//           .map(
//             (e) => BottomNavigationBarItem(
//               icon: e.icon,
//               label: e.label,
//               activeIcon: ShaderMask(
//                 shaderCallback: (bounds) {
//                   return LinearGradient(
//                     colors: <Color>[
//                       context.colors.purpleDark,
//                       const Color(0xFFFF56BB),
//                     ],
//                     begin: Alignment.bottomRight,
//                     end: Alignment.topLeft,
//                   ).createShader(bounds);
//                 },
//                 child: e.icon,
//               ),
//             ),
//           )
//           .toList(),
//       onTap: model.onChangePage,
//       currentIndex: model.selectedPageIndex,
//       backgroundColor: context.colors.background,
//       mouseCursor: SystemMouseCursors.click,
//       showSelectedLabels: false,
//       showUnselectedLabels: false,
//       iconSize: 32,
//       unselectedItemColor: context.colors.white50,
//       selectedItemColor: Colors.white,
//     );
//   }
// }
