import 'package:crypto_currency/core/extensions/build_context_extension.dart';
import 'package:crypto_currency/pages/ranking_screen_model.dart';
import 'package:crypto_currency/widgets/coin_card.dart';
import 'package:crypto_currency/widgets/ranking_list_heading.dart';
import 'package:flutter/material.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final model =
        RankingScreenProvider.watch(context)!.notifier! as RankingScreenModel;
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
      body: ColoredBox(
        color: context.colors.background,
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              await model.refreshCryptoCoins();
            },
            child: Column(
              children: [
                const RankingScreenListHeading(),
                if (model.isLoading && model.cryptoCoins.isEmpty)
                  const CircularProgressIndicator()
                else
                  Expanded(
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
