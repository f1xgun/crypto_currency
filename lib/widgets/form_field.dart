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
          color: Colors.white,
        ),
        suffixIcon: Icon(widget.suffixIcon, color: Colors.grey[700]),
        hintText: widget.text,
        hintStyle: TextStyle(color: Colors.grey[400]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.grey[900]!),
        ),
        fillColor: Colors.grey[850],
        filled: true,
      ),
    );
  }
}
