import 'package:crypto_currency/core/extensions/build_context_extension.dart';
import "package:flutter/material.dart";

import 'package:crypto_currency/widgets/coin_card.dart';
import 'package:crypto_currency/widgets/ranking_list_heading.dart';
import 'ranking_screen_model.dart';

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
        backgroundColor: context.colors.background,
        title: Text(
          'Ranking',
          style: context.textStyles.h4.copyWith(color: context.colors.mainText),
        ),
      ),
      body: Container(
        color: context.colors.background,
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              model.refreshCryptoCoins();
            },
            child: Column(
              children: [
                const RankingScreenListHeading(),
                model.isLoading && model.cryptoCoins.isEmpty
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
        foregroundColor: context.colors.mainText,
        onPressed: model.refreshCryptoCoins,
        backgroundColor: context.colors.background,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
