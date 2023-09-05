import 'package:crypto_currency/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class RankingScreenListHeading extends StatelessWidget {
  const RankingScreenListHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: context.colors.inActiveBackground,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 6,
            child: Text(
              'Asset',
              style: context.textStyles.caption2
                  .copyWith(color: context.colors.dark70),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Last Price',
              style: context.textStyles.caption2
                  .copyWith(color: context.colors.dark70),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: Text(
              '1h Change',
              style: context.textStyles.caption2
                  .copyWith(color: context.colors.dark70),
              maxLines: 1,
            ),
          )
        ],
      ),
    );
  }
}
