// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import 'package:crypto_currency/app_styles.dart';
import 'package:crypto_currency/models/crypto_coin/crypto_coin.dart';

class CoinCard extends StatelessWidget {
  const CoinCard({super.key, required this.coin});
  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kListBackgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: CoinCardLeading(coinId: coin.id)),
          const SizedBox(width: 4),
          Expanded(
            flex: 3,
            child: CoinCardName(name: coin.name, symbol: coin.symbol),
          ),
          Expanded(flex: 2, child: CoinCardPrice(price: coin.quote.price)),
          Expanded(
              flex: 1,
              child: CoinCardPercentChange(percent: coin.quote.percentChange1H))
        ],
      ),
    );
  }
}

class CoinCardLeading extends StatelessWidget {
  const CoinCardLeading({super.key, required this.coinId});
  final int coinId;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 32,
      child: Image.network(
        'https://s2.coinmarketcap.com/static/img/coins/32x32/$coinId.png',
      ),
    );
  }
}

class CoinCardName extends StatelessWidget {
  const CoinCardName({super.key, required this.name, required this.symbol});
  final String name;
  final String symbol;

  @override
  Widget build(BuildContext context) {
    String formattedName = name;
    if (name.length > 10) {
      List<String> partsOfName = name.split(' ');
      formattedName = partsOfName.length == 1
          ? name.substring(6)
          : partsOfName.map((part) => part[0]).join();
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
              text: formattedName,
              style: kQuestrialSemiBold.copyWith(
                fontSize: 18,
                color: Colors.white,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '/',
                  style: kQuestrialRegular.copyWith(
                    color: kLightGrayColor,
                    fontSize: 14,
                  ),
                ),
                TextSpan(
                  text: symbol,
                  style: kQuestrialRegular.copyWith(
                    color: kLightGrayColor,
                    fontSize: 14,
                  ),
                ),
              ]),
        ),
      ],
    );
  }
}

class CoinCardPrice extends StatelessWidget {
  const CoinCardPrice({super.key, required this.price});
  final double price;

  @override
  Widget build(BuildContext context) {
    List<String> partsOfPrice = price.toStringAsFixed(2).split('.');
    String integerPart = partsOfPrice[0].replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (match) => '${match[1]},');
    String formattedPrice =
        '$integerPart.${partsOfPrice[1]}${String.fromCharCodes(Runes('\u0024'))}';

    return Text(
      formattedPrice,
      style: kQuestrialMedium.copyWith(color: Colors.white, fontSize: 18),
    );
  }
}

enum PriceStatus { POSITIVE, SAME, NEGATIVE }

class CoinCardPercentChange extends StatelessWidget {
  const CoinCardPercentChange({super.key, required this.percent});
  final double percent;

  PriceStatus getPriceStatus(double percent) {
    if (percent > 0) return PriceStatus.POSITIVE;
    if (percent == 0) return PriceStatus.SAME;
    return PriceStatus.NEGATIVE;
  }

  @override
  Widget build(BuildContext context) {
    double newPercent = double.parse(percent.toStringAsFixed(2));
    PriceStatus percentStatus = getPriceStatus(newPercent);
    String formattedPercent =
        '${percentStatus == PriceStatus.POSITIVE ? '+' : ''}$newPercent%';

    return percentStatus != PriceStatus.SAME
        ? Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: percentStatus == PriceStatus.POSITIVE
                  ? kDarkGreenColor
                  : kRedDarkColor,
            ),
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                formattedPercent,
                maxLines: 1,
                style: kQuestrialMedium.copyWith(
                  color: percentStatus == PriceStatus.POSITIVE
                      ? kGreenColor
                      : kRedColor,
                ),
              ),
            ),
          )
        : Container();
  }
}
