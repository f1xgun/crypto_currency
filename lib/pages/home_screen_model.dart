import 'package:flutter/material.dart';

class HomeScreenModel extends ChangeNotifier {}

class HomeScreenProvider extends InheritedNotifier {
  const HomeScreenProvider({
    required super.child,
    required HomeScreenModel super.notifier,
    super.key,
  });

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
