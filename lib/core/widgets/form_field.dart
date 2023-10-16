import 'package:crypto_currency/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class FieldOfForm extends StatelessWidget {
  final String placeholderText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double height;
  final EdgeInsets padding;
  final TextEditingController inputController;
  final bool isPassword;
  final void Function(String)? onChanged;
  final TextInputType? textInputType;

  const FieldOfForm({
    required this.placeholderText,
    required this.height,
    required this.padding,
    required this.inputController,
    this.textInputType,
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: context.colors.inActiveBackground,
        borderRadius: BorderRadius.circular(5),
      ),
      alignment: AlignmentDirectional.center,
      child: Row(
        children: [
          if (prefixIcon != null) prefixIcon!,
          Expanded(
            child: TextFormField(
              keyboardType: textInputType,
              onChanged: onChanged,
              textInputAction: TextInputAction.next,
              controller: inputController,
              style: context.textStyles.h4.copyWith(
                color: context.colors.mainText,
                decoration: TextDecoration.none,
                height: 1,
              ),
              decoration: InputDecoration(
                hintText: placeholderText,
                hintStyle: context.textStyles.h4.copyWith(
                  color: context.colors.suffixInput,
                ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                fillColor: context.colors.inActiveBackground,
                filled: true,
              ),
              obscureText: isPassword,
              enableSuggestions: !isPassword,
              autocorrect: !isPassword,
            ),
          ),
          if (suffixIcon != null) suffixIcon!,
        ],
      ),
    );
  }
}
