import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_application_1/domain/entities/cafe.dart';
import 'package:flutter_application_1/domain/repositories/cafe.dart';
import 'package:flutter_application_1/infrastructure/web/core/service.dart';
import 'package:flutter_application_1/infrastructure/web/requests/search_cafe_list.dart';
import 'package:flutter_application_1/infrastructure/web/responses/search_cafe_list.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quiver/core.dart';

class CafeRepositoryImpl implements CafeRepository {
  const CafeRepositoryImpl({required this.webService});

  final WebService webService;

  @override
  Future<List<Cafe>> cafeList() async {
    try {
      final SearchCafeListWebRequest request = SearchCafeListWebRequest(lat: 35.671807, lon: 139.817994);
      final Response<dynamic> response = await webService.execute(request);
      return SearchCafeListWebResponse.fromJson(response.data).toCafeList();
    } on Exception catch (exception) {
      throw exception;
    }
  }

  static dynamic _decodeJson(String source) {
    return jsonDecode(source);
  }

  static String _encodeJson(dynamic value) {
    return jsonEncode(value);
  }
}
