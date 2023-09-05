import 'package:crypto_currency/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class Indicator extends StatefulWidget {
  final bool isActive;
  
  const Indicator({
    required this.isActive,
    super.key,
  });

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
        color: widget.isActive ? context.colors.purple : context.colors.dark70,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
