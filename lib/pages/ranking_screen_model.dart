import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:crypto_currency/models/crypto_coin/crypto_coin.dart';
import 'package:crypto_currency/constants.dart';

class RankingScreenModel extends ChangeNotifier {
  final List<CryptoCoin> _cryptoCoins = [];
  List<CryptoCoin> get cryptoCoins => _cryptoCoins;

  void getCryptoCoins() async {
    final dio = Dio();
    try {
      dio
          .get(
              "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=1&limit=10&convert=USD",
              options: Options(headers: {
                "X-CMC_PRO_API_KEY": COIN_API_KEY,
                "Accept": "application/json",
              }))
          .then((value) => createCryptoCoins(value.data["data"]));
    } catch (e) {
      throw Exception("Failed to load data");
    }
  }

  void createCryptoCoins(dynamic data) {
    for (var coin in data) {
      _cryptoCoins.add(CryptoCoin.fromJson(coin));
    }
    notifyListeners();
  }
}

class RankingScreenProvider extends InheritedNotifier {
  const RankingScreenProvider({
    Key? key,
    required Widget child,
    required RankingScreenModel notifier,
  }) : super(key: key, child: child, notifier: notifier);

  static RankingScreenProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<RankingScreenProvider>();
  }

  static RankingScreenProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<RankingScreenProvider>()
        ?.widget;
    return widget is RankingScreenProvider ? widget : null;
  }
}
