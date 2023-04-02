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
          child: RefreshIndicator(
            onRefresh: () async {
              model.refreshCryptoCoins();
            },
            child: Column(
              children: [
                const RankingScreenListHeading(),
                model.isLoading
                    ? const CircularProgressIndicator()
                    : Expanded(
                        child: ListView.builder(
                          itemCount: model.cryptoCoins.length,
                          itemBuilder: (context, index) {
                            return CoinCard(coin: model.cryptoCoins[index]);
                          },
                          controller: model.scrollController,
                        ),
                      ),
              ],
            ),
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

class RankingScreenListHeading extends StatelessWidget {
  const RankingScreenListHeading({super.key});

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
