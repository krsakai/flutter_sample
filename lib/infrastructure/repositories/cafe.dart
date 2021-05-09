import 'dart:async';
import 'dart:convert';
import 'package:flutter_application_1/domain/entities/cafe.dart';
import 'package:flutter_application_1/domain/repositories/cafe.dart';
import 'package:flutter_application_1/infrastructure/web/core/service.dart';
import 'package:flutter_application_1/infrastructure/web/requests/search_cafe_list.dart';
import 'package:flutter_application_1/infrastructure/web/responses/search_cafe_list.dart';
import 'package:dio/dio.dart';

class CafeRepositoryImpl implements CafeRepository {
  const CafeRepositoryImpl({required this.webService});

  final WebService webService;

  @override
  Future<List<Cafe>> cafeList({required double lat, required double lon}) async {
    try {
      final SearchCafeListWebRequest request = SearchCafeListWebRequest(lat: lat, lon: lon);
      final Response<dynamic> response = await webService.execute(request);
      return SearchCafeListWebResponse.fromJson(response.data).toCafeList();
    } on Exception catch (exception) {
      throw exception;
    }
  }

  static dynamic decodeJson(String source) {
    return jsonDecode(source);
  }

  static String encodeJson(dynamic value) {
    return jsonEncode(value);
  }
}
