import 'package:crypto_currency/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class CutomCheckbox extends StatefulWidget {
  final bool value;
  final void Function(bool?) onChanged;

  const CutomCheckbox(
      {required this.value, required this.onChanged, super.key});

  @override
  State<CutomCheckbox> createState() => _CutomCheckboxState();
}

class _CutomCheckboxState extends State<CutomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: context.colors.purple,
      fillColor: MaterialStatePropertyAll(context.colors.purple),
      value: widget.value,
      onChanged: widget.onChanged,
    );
  }
}
