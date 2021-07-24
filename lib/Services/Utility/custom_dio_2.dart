import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class QuoteAPIClient {
  static String baseUrl = 'https://newsapi.org/v2/everything';
  static String accessKey = 'dda7bcc6b337435f9dc0644891914306';

  final Dio _dio = _initDio();

  static QuoteAPIClient _instance() => new QuoteAPIClient._();

  factory QuoteAPIClient() {
    return _instance();
  }

  QuoteAPIClient._();

  static _initDio() {
    final _dio = Dio(
      BaseOptions(
        contentType: 'application/json; charset=utf-8',
        baseUrl: baseUrl,
      ),
    );
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    // dio.interceptors
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options) async {
          print(options.uri);
          return options;
        },
        onResponse: (Response response) async {
          return response;
        },
        onError: (DioError err) async {
          print(err.message);
          return err; //continue
        },
      ),
    );
    return _dio;
  }

  Future get(String url, [Map<String, dynamic> params]) async {
    return _dio.get(url, queryParameters: params);
  }
}
