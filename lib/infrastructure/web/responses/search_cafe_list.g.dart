// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_cafe_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchCafeListWebResponse _$SearchCafeListWebResponseFromJson(
    Map<String, dynamic> json) {
  return SearchCafeListWebResponse(
    cafeList: (json['results'] as List<dynamic>)
        .map((e) => _Cafe.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

_Cafe _$_CafeFromJson(Map<String, dynamic> json) {
  return _Cafe(
    name: json['name'] as String,
  );
}
