import 'package:crypto_currency/app_styles.dart';
import 'package:crypto_currency/pages/home_screen_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final model =
        HomeScreenProvider.watch(context)!.notifier as HomeScreenModel;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
