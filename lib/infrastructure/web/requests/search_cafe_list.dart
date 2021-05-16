import 'package:flutter_application_1/infrastructure/web/core/request.dart';

class SearchCafeListWebRequest extends WebRequest {
  final double lat;
  final double lon;

  SearchCafeListWebRequest({required this.lat, required this.lon});

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
