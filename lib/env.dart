import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEnv {
  final String coinApiKey = dotenv.get('COIN_API_KEY');
}

final appEnv = AppEnv();
