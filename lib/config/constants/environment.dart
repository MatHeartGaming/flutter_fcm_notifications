
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {

  static final String firebaseApiKeyAndroid = dotenv.env['FIREBASE_API_KEY_ANDROID'] ?? "No Firebase api key for Android";
  static final String firebaseApiKeyIos = dotenv.env['FIREBASE_API_KEY_IOS'] ?? "No Firebase api key for iOS";
  static final String appId = dotenv.env['APP_ID'] ?? "No appId key";
  static final String messageSenderId = dotenv.env['MESSAGE_SENDER_ID'] ?? "No message sender key";

}