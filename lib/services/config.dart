import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static Map<String, String> envVars = Platform.environment;

  static Future<void> load() async {
    try {
      await dotenv.load();
      envVars = {...envVars, ...dotenv.env};
    } on Exception catch (e) {
      print("Error loading .env file: $e");
    }
  }

  static String get apiKey => envVars['COIN_API_KEY'] ?? '';
}
