import "package:crypto_currency/core/extensions/build_context_extension.dart";
import "package:flutter/material.dart";

class FieldOfForm extends StatefulWidget {
  const FieldOfForm(
      {super.key, required this.text, this.prefixIcon, this.suffixIcon});
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
      controller: _textEditingContoller,
      decoration: InputDecoration(
        prefixIcon: Icon(
          widget.prefixIcon,
          color: context.colors.prefixInputIcon,
        ),
        suffixIcon: Icon(widget.suffixIcon, color: context.colors.suffixInput),
        hintText: widget.text,
        hintStyle: context.textStyles.h4.copyWith(color: context.colors.suffixInput),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.grey[900]!),
        ),
        fillColor: context.colors.inActiveBackground,
        filled: true,
      ),
    );
  }
}
