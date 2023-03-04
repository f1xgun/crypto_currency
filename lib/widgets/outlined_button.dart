import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton(
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
        side: MaterialStateProperty.all(BorderSide(color: Colors.purple[500]!)),
      ),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w500),
      ),
    );
  }
}
