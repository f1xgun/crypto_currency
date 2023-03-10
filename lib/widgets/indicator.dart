import 'package:flutter/material.dart';

class Indicator extends StatefulWidget {
  const Indicator({super.key, required this.isActive});
  final bool isActive;

  @override
  State<Indicator> createState() => _IndicatorState();
}

class _IndicatorState extends State<Indicator> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: widget.isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: widget.isActive ? Colors.purple[400] : Colors.grey,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}
