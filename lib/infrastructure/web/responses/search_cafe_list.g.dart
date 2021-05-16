// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_cafe_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchCafeListWebResponse _$SearchCafeListWebResponseFromJson(
    Map<String, dynamic> json) {
  return SearchCafeListWebResponse(
    cafeList: (json['results'] as List<dynamic>)
        .map((e) => _CafeInformation.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

// ignore: non_constant_identifier_names
_CafeInformation _$_CafeInformationFromJson(Map<String, dynamic> json) {
  return _CafeInformation(
    name: json['name'] as String,
    geometry: _CafeGeometry.fromJson(json['geometry'] as Map<String, dynamic>),
    photos: (json['photos'] as List<dynamic>?)
        ?.map((e) => _CafePhotos.fromJson(e as Map<String, dynamic>))
        .toList(),
    iconUrl: json['icon'] as String,
    rating: (json['rating'] as num?)?.toDouble(),
    vicinity: json['vicinity'] as String,
  );
}

// ignore: non_constant_identifier_names
_CafePhotos _$_CafePhotosFromJson(Map<String, dynamic> json) {
  return _CafePhotos(
    width: json['width'] as int,
    height: json['height'] as int,
    reference: json['photo_reference'] as String,
  );
}

// ignore: non_constant_identifier_names
_CafeGeometry _$_CafeGeometryFromJson(Map<String, dynamic> json) {
  return _CafeGeometry(
    location: _CafeLocation.fromJson(json['location'] as Map<String, dynamic>),
  );
}

// ignore: non_constant_identifier_names
_CafeLocation _$_CafeLocationFromJson(Map<String, dynamic> json) {
  return _CafeLocation(
    lat: (json['lat'] as num).toDouble(),
    lon: (json['lng'] as num).toDouble(),
  );
}
