import 'package:crypto_currency/app_styles.dart';
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
        color: kListBackgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Expanded(
            flex: 6,
            child: Text(
              'Asset',
              style: TextStyle(color: kDarkGrayColor),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Last Price',
              style: TextStyle(color: kDarkGrayColor),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: Text(
              '1h Change',
              style: TextStyle(color: kDarkGrayColor),
              maxLines: 1,
            ),
          )
        ],
      ),
    );
  }
}
