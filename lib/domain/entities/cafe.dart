import 'package:flutter/foundation.dart';

@immutable
class Cafe {
  const Cafe({
    required this.name,
    required this.lat,
    required this.lon,
    required this.iconUrl,
    this.photoUrl,
    this.rating,
    required this.vicinity,
  });

  final String name;

  final double lat;

  final double lon;

  final String iconUrl;

  final String? photoUrl;

  final double? rating;

  final String vicinity;
}
