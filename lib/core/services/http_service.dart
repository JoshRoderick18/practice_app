import 'package:dio/dio.dart';

class HttpService {
  final _dio = Dio();
  String baseUrl = 'https://rickandmortyapi.com/api';

  HttpService() {
    _dio.options.baseUrl = baseUrl;
    _dio.options.headers["Content-Type"] = "application/json";
  }

  Dio get dio => _dio;
}
