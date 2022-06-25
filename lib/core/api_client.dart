import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiClient {
  // https://api.clashofclans.com/v1/players/
  final baseUrl = 'https://api.clashofclans.com/';
  final apiKey = dotenv.get('API_KEY');

  Dio dio = Dio();
}