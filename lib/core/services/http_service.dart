import 'package:dio/dio.dart';

class HttpService {
  final _dio = Dio();

  HttpService();

  Dio get dio => _dio;
}
