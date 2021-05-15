import 'package:flutter_application_1/domain/entities/cafe.dart';
// import 'package:asobi/domain/values/area_type.dart';
import 'package:flutter_application_1/infrastructure/web/core/response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_cafe_list.g.dart';

@JsonSerializable(createToJson: false)
class SearchCafeListWebResponse extends WebResponse {
  const SearchCafeListWebResponse({required this.cafeList});

  factory SearchCafeListWebResponse.fromJson(Map<String, dynamic> json) => _$SearchCafeListWebResponseFromJson(json);

  @JsonKey(name: 'results')
  final List<_Cafe> cafeList;

  List<Cafe> toCafeList() => cafeList.map((cafe) => Cafe(name: cafe.name)).toList();
}

@JsonSerializable(createToJson: false)
class _Cafe {
  _Cafe({required this.name});
  factory _Cafe.fromJson(Map<String, dynamic> json) => _$_CafeFromJson(json);
  final String name;
}
