import 'package:crypto_currency/models/crypto_coin/crypto_coin.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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

  Future<void> getCryptoCoins([int? begin, int? end]) async {
    final dio = Dio();
    _isLoading = true;
    try {
      await dio
          .get(
            'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=${begin ?? 1}&limit=${end ?? 10}&convert=USD',
            options: Options(
              headers: {
                'X-CMC_PRO_API_KEY': '6bc8ae01-d189-45fd-8b3e-3ffa6a91bced',
                'Accept': 'application/json',
                'Access-Control-Allow-Headers': '*',
                'Access-Control-Allow-Origin': '*',
                'Access-Control-Allow-Credentials': 'true',
              },
            ),
          )
          .then((value) => createCryptoCoins((value.data
              as Map<String, dynamic>)['data'] as List<Map<String, dynamic>>));
    } on Object {
      throw Exception('Failed to load data');
    }
  }

  void createCryptoCoins(List<Map<String, dynamic>> data) {
    for (final coin in data) {
      _cryptoCoins.add(CryptoCoin.fromJson(coin));
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> refreshCryptoCoins() async {
    final length = _cryptoCoins.length;
    _cryptoCoins.clear();
    await getCryptoCoins(1, length);
    notifyListeners();
  }

  void getMoreCryptoCoins() {
    getCryptoCoins(_cryptoCoins.length + 1, _cryptoCoins.length + 10);
  }
}

class RankingScreenProvider extends InheritedNotifier {
  const RankingScreenProvider({
    required super.child,
    required RankingScreenModel super.notifier,
    super.key,
  });

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
