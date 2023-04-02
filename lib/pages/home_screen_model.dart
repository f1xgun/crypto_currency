import 'package:flutter/material.dart';

class HomeScreenModel extends ChangeNotifier {}

class HomeScreenProvider extends InheritedNotifier {
  const HomeScreenProvider({
    Key? key,
    required Widget child,
    required HomeScreenModel notifier,
  }) : super(key: key, child: child, notifier: notifier);

  static HomeScreenProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<HomeScreenProvider>();
  }

  static HomeScreenProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<HomeScreenProvider>()
        ?.widget;
    return widget is HomeScreenProvider ? widget : null;
  }
}
