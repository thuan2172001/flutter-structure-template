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
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
          print({"onRequest": options.uri});
          return handler.next(options); //continue
        },
        onResponse:
            (Response response, ResponseInterceptorHandler handler) async {
          print({'onResponse': response});
          return handler.next(response);
        },
        onError: (DioError error, ErrorInterceptorHandler handler) async {
          print({'onError': error});
          return handler.next(error); //continue
        },
        // onRequest: (RequestOptions options) async {
        //   print('onRequest');
        //   print({"request": options});
        //   return options; //continue
        // },
        // onResponse: (Response response) async {
        //   print({"response": response});
        //   return (response);
        // },
        // onError: (DioError error) async {
        //   print({"error": error});
        //   return error; //continue
        // },
      ),
    );
    return _dio;
  }

  Future get(String url, [Map<String, dynamic> params]) async {
    return _dio.get(url, queryParameters: params);
  }
}
