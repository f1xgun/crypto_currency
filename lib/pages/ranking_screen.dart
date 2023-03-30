import 'package:crypto_currency/widgets/coin_card.dart';
import "package:flutter/material.dart";
import 'ranking_screen_model.dart';

import '../app_styles.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final model =
        RankingScreenProvider.watch(context)!.notifier as RankingScreenModel;
    if (model.cryptoCoins.isEmpty && !model.isLoading) {
      model.getCryptoCoins();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: const Text(
          'Ranking',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: kBackgroundColor,
        child: SafeArea(
          child: ListView.builder(
            itemCount: model.cryptoCoins.length,
            itemBuilder: (context, index) {
              return CoinCard(coin: model.cryptoCoins[index]);
            },
            controller: model.scrollController,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: model.refreshCryptoCoins,
        backgroundColor: kBackgroundColor,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
