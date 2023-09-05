import 'package:crypto_currency/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class FieldOfForm extends StatefulWidget {
  const FieldOfForm(
      {required this.text, super.key, this.prefixIcon, this.suffixIcon});
  final String text;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  @override
  State<FieldOfForm> createState() => _FieldOfFormState();
}

class _FieldOfFormState extends State<FieldOfForm> {
  final _textEditingContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      enableSuggestions: false,
      controller: _textEditingContoller,
      // keyboardType: TextInputType.visiblePassword,
      style: context.textStyles.h4.copyWith(
        color: context.colors.mainText,
        decoration: TextDecoration.none,
      ),
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon != null
            ? Icon(
                widget.prefixIcon,
                color: context.colors.prefixInputIcon,
                size: 24,
              )
            : null,
        suffixIcon: widget.suffixIcon != null
            ? Icon(
                widget.suffixIcon,
                color: context.colors.suffixInput,
              )
            : null,
        hintText: widget.text,
        hintStyle: context.textStyles.h4.copyWith(
          color: context.colors.suffixInput,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        fillColor: context.colors.inActiveBackground,
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
      ),
    );
  }
}
