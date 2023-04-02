import 'package:crypto_currency/app_styles.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, required this.icon});
  final Image icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: kListBackgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: IconButton(
        onPressed: () {},
        icon: icon,
      ),
    );
  }
}
