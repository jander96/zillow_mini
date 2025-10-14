import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environments {
  static String get host => dotenv.get('HOST', fallback: 'localhost');
}