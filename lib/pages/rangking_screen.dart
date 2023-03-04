import "package:flutter/material.dart";

import "../app_style.dart";

class RangkingPage extends StatefulWidget {
  const RangkingPage({super.key});

  @override
  State<RangkingPage> createState() => _RangkingPageState();
}

class _RangkingPageState extends State<RangkingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Rangking',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
