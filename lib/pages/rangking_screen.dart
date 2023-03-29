import 'dart:convert';
import 'package:crypto_currency/constants.dart';
import 'package:crypto_currency/widgets/coin_card.dart';
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;

import 'package:crypto_currency/models/payload/payload.dart';

import '../app_styles.dart';

class RangkingPage extends StatefulWidget {
  const RangkingPage({super.key});

  @override
  State<RangkingPage> createState() => _RangkingPageState();
}

class _RangkingPageState extends State<RangkingPage> {
  late Future<Payload> _cryptoCoins;

  Future<Payload> getCryptoCoins() async {
    var response = await http.get(
        Uri.parse(
            "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=1&limit=10&convert=USD"),
        headers: {
          "X-CMC_PRO_API_KEY": COIN_API_KEY,
          "Accept": "application/json",
        });
    if (response.statusCode == 200) {
      return Payload.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load data");
    }
  }

  @override
  void initState() {
    super.initState();
    _cryptoCoins = getCryptoCoins();
  }

  @override
  Widget build(BuildContext context) {
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
          child: FutureBuilder<Payload>(
            future: _cryptoCoins,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Center(
                    child: Text("No data"),
                  );
                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.active:
                  return const Center(
                    child: Text("Active"),
                  );
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Text('${snapshot.error}',
                        style: const TextStyle(color: Colors.red));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.data.length,
                      itemBuilder: (context, index) {
                        return CoinCard(coin: snapshot.data!.data[index]);
                      },
                    );
                  }
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _cryptoCoins = getCryptoCoins();
          });
        },
        backgroundColor: kBackgroundColor,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
