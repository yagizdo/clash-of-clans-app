import 'package:dio/dio.dart';

class ApiClient {
  // https://api.clashofclans.com/v1/players/
  final baseUrl = 'https://api.clashofclans.com/';

  Dio dio = Dio();
}