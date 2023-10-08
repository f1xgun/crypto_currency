import 'package:crypto_currency/core/extensions/build_context_extension.dart';
import 'package:crypto_currency/features/coin_ranking_list/domain/entities/coin.dart';
import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {
  const CoinCard({required this.coin, super.key});
  final Coin coin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: context.colors.inActiveBackground,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: CoinCardLeading(url: coin.imageUrl ?? '')),
          const SizedBox(width: 4),
          Expanded(
            flex: 3,
            child: CoinCardName(name: coin.symbol, symbol: coin.symbol),
          ),
          Expanded(flex: 2, child: CoinCardPrice(price: coin.price)),
          Expanded(
              child: CoinCardPercentChange(percent: coin.priceChangePercent24h))
        ],
      ),
    );
  }
}

class CoinCardLeading extends StatelessWidget {
  const CoinCardLeading({required this.url, super.key});
  final String url;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 32,
      child: Image.network(
        url,
      ),
    );
  }
}

class CoinCardName extends StatelessWidget {
  const CoinCardName({required this.name, required this.symbol, super.key});
  final String name;
  final String symbol;

  @override
  Widget build(BuildContext context) {
    var formattedName = name;
    if (name.length > 10) {
      final partsOfName = name.split(' ');
      formattedName = partsOfName.length == 1
          ? name.substring(6)
          : partsOfName.map((part) => part[0]).join();
    }

    return Row(
      children: [
        RichText(
          text: TextSpan(
            text: formattedName,
            style: context.textStyles.headline.copyWith(
              color: context.colors.mainText,
            ),
            children: <TextSpan>[
              TextSpan(
                text: '/',
                style: context.textStyles.body.copyWith(
                  color: context.colors.subText,
                ),
              ),
              TextSpan(
                text: symbol,
                style: context.textStyles.body.copyWith(
                  color: context.colors.subText,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CoinCardPrice extends StatelessWidget {
  const CoinCardPrice({required this.price, super.key});
  final double price;

  @override
  Widget build(BuildContext context) {
    final partsOfPrice = price.toStringAsFixed(2).split('.');
    final integerPart = partsOfPrice[0].replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (match) => '${match[1]},');
    final formattedPrice =
        '${String.fromCharCodes(Runes('\u0024'))}$integerPart.${partsOfPrice[1]}';

    return Text(
      formattedPrice,
      style: context.textStyles.body.copyWith(
        color: context.colors.mainText,
      ),
    );
  }
}

enum PriceStatus { positive, same, negative }

class CoinCardPercentChange extends StatelessWidget {
  const CoinCardPercentChange({required this.percent, super.key});
  final double percent;

  PriceStatus getPriceStatus(double percent) {
    if (percent > 0) return PriceStatus.positive;
    if (percent == 0) return PriceStatus.same;
    return PriceStatus.negative;
  }

  @override
  Widget build(BuildContext context) {
    final newPercent = double.parse(percent.toStringAsFixed(2));
    final percentStatus = getPriceStatus(newPercent);
    final formattedPercent =
        '${percentStatus == PriceStatus.positive ? '+' : ''}$newPercent%';

    return percentStatus != PriceStatus.same
        ? Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: percentStatus == PriceStatus.positive
                  ? context.colors.priceUpBackground
                  : context.colors.priceDownBackground,
            ),
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                formattedPercent,
                maxLines: 1,
                style: context.textStyles.caption2.copyWith(
                  color: percentStatus == PriceStatus.positive
                      ? context.colors.priceUpText
                      : context.colors.red,
                ),
              ),
            ),
          )
        : Container();
  }
}
