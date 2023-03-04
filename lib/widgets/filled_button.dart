import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({super.key, required this.onPressed, required this.text});

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
        backgroundColor: MaterialStateProperty.all(Colors.purple[400]),
      ),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w500),
      ),
    );
  }
}
