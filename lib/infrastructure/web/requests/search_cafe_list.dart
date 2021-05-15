import 'package:flutter_application_1/infrastructure/web/core/request.dart';

// https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=35.671807,139.817994&language=ja&rankby=distance&types=cafe&key=AIzaSyAxJ7Y2IMFTBs-68uiEK9RwSjNaTIPCvjA

class SearchCafeListWebRequest extends WebRequest {
  final double lat;
  final double lon;

  SearchCafeListWebRequest({required double lat, required double lon}) : lat = lat,lon = lon;

  @override
  final String path = '/maps/api/place/nearbysearch/json';

  @override
  final HttpMethod httpMethod = HttpMethod.get;

  @override
  final Map<String, String> httpHeaders = {};

  @override
  final dynamic data = null;

  @override
  Map<String, dynamic> get queryParameters => {
    "location": lat.toString() + "," + lon.toString(),
    "language": "ja",
    "rankby": "distance",
    "types": "cafe",
    "key": "AIzaSyAxJ7Y2IMFTBs-68uiEK9RwSjNaTIPCvjA"
  };
}
