import 'package:crypto_currency/services/config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:crypto_currency/models/crypto_coin/crypto_coin.dart';

class RankingScreenModel extends ChangeNotifier {
  final List<CryptoCoin> _cryptoCoins = [];
  bool _isLoading = false;
  final ScrollController _scrollController = ScrollController();

  List<CryptoCoin> get cryptoCoins => _cryptoCoins;
  bool get isLoading => _isLoading;
  ScrollController get scrollController => _scrollController;

  RankingScreenModel() {
    _scrollController.addListener(_scrollControllerListener);
  }

  void _scrollControllerListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      getMoreCryptoCoins();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void getCryptoCoins([int? begin, int? end]) async {
    final dio = Dio();
    _isLoading = true;
    try {
      dio
          .get(
            "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=${begin ?? 1}&limit=${end ?? 10}&convert=USD",
            options: Options(
              headers: {
                "X-CMC_PRO_API_KEY": Config.apiKey,
                "Accept": "application/json",
              },
            ),
          )
          .then((value) => createCryptoCoins(value.data["data"]));
    } catch (e) {
      throw Exception("Failed to load data");
    }
  }

  void createCryptoCoins(dynamic data) {
    for (var coin in data) {
      _cryptoCoins.add(CryptoCoin.fromJson(coin));
    }
    _isLoading = false;
    notifyListeners();
  }

  void refreshCryptoCoins() async {
    int length = _cryptoCoins.length;
    _cryptoCoins.clear();
    getCryptoCoins(1, length);
    notifyListeners();
  }

  void getMoreCryptoCoins() {
    getCryptoCoins(_cryptoCoins.length + 1, _cryptoCoins.length + 10);
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
