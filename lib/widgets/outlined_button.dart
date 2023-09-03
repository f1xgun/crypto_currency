import 'package:crypto_currency/core/extensions/build_context_extension.dart';
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
        side: MaterialStateProperty.all(
            BorderSide(color: context.colors.purpleDark)),
      ),
      child: Text(
        text,
        style: context.textStyles.h4.copyWith(
          color: context.colors.transparentButtonText,
        ),
      ),
    );
  }
}
