import 'package:crypto_currency/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton(
      {required this.onPressed,
      required this.text,
      super.key,
      this.isActive = true});

  final String text;
  final VoidCallback onPressed;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isActive ? onPressed : null,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 20),
        ),
        backgroundColor: isActive
            ? MaterialStateProperty.all(context.colors.purpleDark)
            : MaterialStateProperty.all(context.colors.white50),
        side: const MaterialStatePropertyAll(BorderSide.none),
        shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      ),
      child: Text(
        text,
        style: context.textStyles.h4.copyWith(color: context.colors.white),
      ),
    );
  }
}
