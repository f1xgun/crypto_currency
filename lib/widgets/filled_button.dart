import 'package:crypto_currency/app_styles.dart';
import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton(
      {super.key, required this.onPressed, required this.text});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 20),
        ),
        backgroundColor:
            MaterialStateProperty.all(const Color.fromARGB(255, 141, 76, 254)),
      ),
      child: Text(
        text,
        style: kQuestrialMedium.copyWith(
          color: Colors.white,
          fontSize: 20.0,
        ),
      ),
    );
  }
}
