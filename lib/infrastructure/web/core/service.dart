import 'dart:convert';

import 'package:flutter_application_1/infrastructure/web/core/request.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class WebService {
  /// リクエストを送信する。
  Future<Response<dynamic>> execute<T extends WebRequest>(T request);

  /// APIClientを再生成する。
  void refresh();
}

class WebServiceImpl implements WebService {
  WebServiceImpl() : _dio = _makeDio();

  Future<Dio> _dio;
  
  static Future<Dio> _makeDio() async {
    final Dio dio = Dio();
    dio.options.connectTimeout = 15000;
    dio.options.baseUrl = "https://maps.googleapis.com";
    (dio.transformer as DefaultTransformer).jsonDecodeCallback = (String source) {
      return compute<String, dynamic>(_decodeJson, source);
    };
    return dio;
  }

  static dynamic _decodeJson(String source) {
    return jsonDecode(source);
  }

  @override
  Future<Response<dynamic>> execute<T extends WebRequest>(T request) async {
    final Dio dio = await _dio;
    return await dio.request<dynamic>(
      request.path,
      data: request.data,
      queryParameters: request.queryParameters,
      options: Options(
        method: request.httpMethod.value,
        headers: request.httpHeaders,
      ),
    );
  }

  void refresh() {
    _dio = _makeDio();
  }
}
