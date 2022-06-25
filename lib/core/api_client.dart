import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiClient {

  // Base URL of the API
  final baseUrl = 'https://api.clashofclans.com/';

  // Api key
  final apiKey = dotenv.get('API_KEY');

  // Dio instance
  Dio dio = Dio();
}