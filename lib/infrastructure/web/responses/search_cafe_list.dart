import 'package:flutter_application_1/domain/entities/cafe.dart';
import 'package:flutter_application_1/infrastructure/web/core/response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_cafe_list.g.dart';

@JsonSerializable(createToJson: false)
class SearchCafeListWebResponse extends WebResponse {
  const SearchCafeListWebResponse({required this.cafeList});

  factory SearchCafeListWebResponse.fromJson(Map<String, dynamic> json) => _$SearchCafeListWebResponseFromJson(json);

  @JsonKey(name: 'results')
  final List<_CafeInformation> cafeList;

  List<Cafe> toCafeList() => cafeList.map((cafe) => Cafe(
    name: cafe.name,
    lat: cafe.geometry.location.lat,
    lon: cafe.geometry.location.lon,
    iconUrl: cafe.iconUrl,
    photoUrl: cafe.photos?[0].photoUrl,
    rating: cafe.rating,
    vicinity: cafe.vicinity,
  )).toList();
}

@JsonSerializable(createToJson: false)
class _CafeInformation {
  _CafeInformation({
    required this.name, 
    required this.geometry,
    this.photos,
    required this.iconUrl,
    this.rating,
    required this.vicinity,
  });
  factory _CafeInformation.fromJson(Map<String, dynamic> json) => _$_CafeInformationFromJson(json);

  final String name;

  final _CafeGeometry geometry;

  final List<_CafePhotos>? photos;

  @JsonKey(name: 'icon')
  final String iconUrl;

  final double? rating;

  final String vicinity;
}

@JsonSerializable(createToJson: false)
class _CafePhotos{
  _CafePhotos({
    required this.width,
    required this.height,
    required this.reference
  });

  factory _CafePhotos.fromJson(Map<String, dynamic> json) => _$_CafePhotosFromJson(json);

  final int width;

  final int height;

  @JsonKey(name: 'photo_reference')
  final String reference;

  String get photoUrl => "https://maps.googleapis.com/maps/api/place/photo?maxwidth=${width}&maxheight=${height}&photoreference=${reference}&key=";
}

@JsonSerializable(createToJson: false)
class _CafeGeometry {
  _CafeGeometry({
    required this.location,
  });
  factory _CafeGeometry.fromJson(Map<String, dynamic> json) => _$_CafeGeometryFromJson(json);
  final _CafeLocation location;
}

@JsonSerializable(createToJson: false)
class _CafeLocation {
  _CafeLocation({
    required this.lat, 
    required this.lon,
  });
  factory _CafeLocation.fromJson(Map<String, dynamic> json) => _$_CafeLocationFromJson(json);
  final double lat;

  @JsonKey(name: 'lng')
  final double lon;
}
