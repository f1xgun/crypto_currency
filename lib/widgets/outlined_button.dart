import 'package:crypto_currency/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  
  const CustomOutlinedButton({
    required this.onPressed,
    required this.text,
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 20),
        ),
        side: MaterialStateProperty.all(
          BorderSide(color: context.colors.purpleDark),
        ),
        shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
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
